import nodemailer from 'nodemailer';
import { config } from '../config/env';

export class EmailService {
  private static transporter = nodemailer.createTransport({
    host: config.email.smtpHost,
    port: config.email.smtpPort,
    secure: config.email.smtpPort === 465,
    auth: {
      user: config.email.smtpUser,
      pass: config.email.smtpPass,
    },
  });

  static async sendEmail(to: string, subject: string, html: string): Promise<void> {
    if (!config.email.smtpPass) {
      console.warn('Email service not configured. Skipping email send.');
      return;
    }

    try {
      await this.transporter.sendMail({
        from: config.email.smtpFrom,
        to,
        subject,
        html,
      });
      console.log(`✅ Email sent to ${to}`);
    } catch (error) {
      console.error('Failed to send email:', error);
      throw error;
    }
  }

  static async sendPasswordResetEmail(to: string, resetToken: string): Promise<void> {
    const resetUrl = `${process.env.FRONTEND_URL || 'http://localhost:4200'}/reset-password?token=${resetToken}`;
    const html = `
      <h2>Password Reset Request</h2>
      <p>You requested to reset your password. Click the link below to reset it:</p>
      <a href="${resetUrl}">Reset Password</a>
      <p>If you didn't request this, please ignore this email.</p>
      <p>This link will expire in 1 hour.</p>
    `;

    await this.sendEmail(to, 'Password Reset Request', html);
  }

  static async sendPriceAlertEmail(to: string, tokenSymbol: string, price: number, targetPrice: number): Promise<void> {
    const html = `
      <h2>Price Alert: ${tokenSymbol}</h2>
      <p>The price of ${tokenSymbol} has reached your target!</p>
      <p><strong>Current Price:</strong> $${price.toFixed(2)}</p>
      <p><strong>Target Price:</strong> $${targetPrice.toFixed(2)}</p>
    `;

    await this.sendEmail(to, `Price Alert: ${tokenSymbol}`, html);
  }
}


