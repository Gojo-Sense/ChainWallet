import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { v4 as uuidv4 } from 'uuid';
import { User, Session } from '../models';
import { config } from '../config/env';
import { JwtPayload } from '../types';

export class AuthService {
  static async register(email: string, password: string, deviceInfo: string, ipAddress: string): Promise<{ user: User; accessToken: string; refreshToken: string }> {
    // Check if user already exists
    const existingUser = await User.findOne({ where: { email } });
    if (existingUser) {
      throw new Error('User with this email already exists');
    }

    // Hash password
    const saltRounds = 10;
    const passwordHash = await bcrypt.hash(password, saltRounds);

    // Create user
    const user = await User.create({
      email,
      passwordHash,
      emailVerified: false,
    });

    // Create session and tokens
    const { accessToken, refreshToken, session } = await this.createSession(user.id, deviceInfo, ipAddress);

    return { user, accessToken, refreshToken };
  }

  static async login(email: string, password: string, deviceInfo: string, ipAddress: string): Promise<{ user: User; accessToken: string; refreshToken: string }> {
    // Find user
    const user = await User.findOne({ where: { email } });
    if (!user) {
      throw new Error('Invalid email or password');
    }

    // Verify password
    const isValidPassword = await bcrypt.compare(password, user.passwordHash);
    if (!isValidPassword) {
      throw new Error('Invalid email or password');
    }

    // Create session and tokens
    const { accessToken, refreshToken } = await this.createSession(user.id, deviceInfo, ipAddress);

    return { user, accessToken, refreshToken };
  }

  static async createSession(userId: string, deviceInfo: string, ipAddress: string): Promise<{ accessToken: string; refreshToken: string; session: Session }> {
    const sessionId = uuidv4();
    const refreshToken = jwt.sign(
      { userId, sessionId },
      config.jwt.refreshSecret,
      { expiresIn: config.jwt.refreshExpiresIn }
    );

    // Calculate expiration date
    const expiresAt = new Date();
    expiresAt.setDate(expiresAt.getDate() + 7); // 7 days

    // Create session
    const session = await Session.create({
      userId,
      deviceInfo,
      ipAddress,
      refreshToken,
      expiresAt,
    });

    // Create access token
    const accessToken = jwt.sign(
      { userId, email: (await User.findByPk(userId))?.email || '', sessionId },
      config.jwt.secret,
      { expiresIn: config.jwt.expiresIn }
    );

    return { accessToken, refreshToken, session };
  }

  static async refreshToken(refreshToken: string): Promise<{ accessToken: string; refreshToken: string }> {
    // Verify refresh token
    let decoded: JwtPayload;
    try {
      decoded = jwt.verify(refreshToken, config.jwt.refreshSecret) as JwtPayload;
    } catch (error) {
      throw new Error('Invalid refresh token');
    }

    // Find session
    const session = await Session.findOne({
      where: { refreshToken, userId: decoded.userId },
    });

    if (!session || session.expiresAt < new Date()) {
      throw new Error('Session expired or invalid');
    }

    // Get user
    const user = await User.findByPk(decoded.userId);
    if (!user) {
      throw new Error('User not found');
    }

    // Generate new tokens
    const newRefreshToken = jwt.sign(
      { userId: user.id, sessionId: session.id },
      config.jwt.refreshSecret,
      { expiresIn: config.jwt.refreshExpiresIn }
    );

    const newAccessToken = jwt.sign(
      { userId: user.id, email: user.email, sessionId: session.id },
      config.jwt.secret,
      { expiresIn: config.jwt.expiresIn }
    );

    // Update session
    const expiresAt = new Date();
    expiresAt.setDate(expiresAt.getDate() + 7);
    await session.update({ refreshToken: newRefreshToken, expiresAt });

    return { accessToken: newAccessToken, refreshToken: newRefreshToken };
  }

  static async logout(refreshToken: string): Promise<void> {
    await Session.destroy({ where: { refreshToken } });
  }

  static async logoutAll(userId: string): Promise<void> {
    await Session.destroy({ where: { userId } });
  }

  static async changePassword(userId: string, oldPassword: string, newPassword: string): Promise<void> {
    const user = await User.findByPk(userId);
    if (!user) {
      throw new Error('User not found');
    }

    // Verify old password
    const isValidPassword = await bcrypt.compare(oldPassword, user.passwordHash);
    if (!isValidPassword) {
      throw new Error('Invalid current password');
    }

    // Hash new password
    const saltRounds = 10;
    const passwordHash = await bcrypt.hash(newPassword, saltRounds);

    // Update password
    await user.update({ passwordHash });
  }
}


