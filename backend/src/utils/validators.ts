import { body, ValidationChain } from 'express-validator';

export const registerValidator: ValidationChain[] = [
  body('email')
    .isEmail()
    .withMessage('Please provide a valid email')
    .normalizeEmail(),
  body('password')
    .isLength({ min: 8 })
    .withMessage('Password must be at least 8 characters long')
    .matches(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/)
    .withMessage('Password must contain at least one uppercase letter, one lowercase letter, and one number'),
];

export const loginValidator: ValidationChain[] = [
  body('email')
    .isEmail()
    .withMessage('Please provide a valid email')
    .normalizeEmail(),
  body('password')
    .notEmpty()
    .withMessage('Password is required'),
];

export const refreshTokenValidator: ValidationChain[] = [
  body('refreshToken')
    .notEmpty()
    .withMessage('Refresh token is required'),
];

export const walletValidator: ValidationChain[] = [
  body('address')
    .notEmpty()
    .withMessage('Wallet address is required')
    .isLength({ min: 26, max: 42 })
    .withMessage('Invalid wallet address format'),
  body('network')
    .optional()
    .isIn(['ethereum', 'bitcoin', 'polygon', 'binance'])
    .withMessage('Invalid network'),
  body('nickname')
    .optional()
    .isLength({ max: 50 })
    .withMessage('Nickname must be less than 50 characters'),
];

export const transactionValidator: ValidationChain[] = [
  body('txHash')
    .notEmpty()
    .withMessage('Transaction hash is required')
    .matches(/^0x[a-fA-F0-9]{64}$/)
    .withMessage('Invalid transaction hash format'),
  body('fromAddress')
    .notEmpty()
    .withMessage('From address is required'),
  body('toAddress')
    .notEmpty()
    .withMessage('To address is required'),
  body('amount')
    .notEmpty()
    .withMessage('Amount is required')
    .isFloat({ min: 0 })
    .withMessage('Amount must be a positive number'),
  body('tokenSymbol')
    .notEmpty()
    .withMessage('Token symbol is required'),
  body('network')
    .optional()
    .isIn(['ethereum', 'polygon', 'binance'])
    .withMessage('Invalid network'),
];

export const priceAlertValidator: ValidationChain[] = [
  body('tokenSymbol')
    .notEmpty()
    .withMessage('Token symbol is required')
    .isLength({ min: 2, max: 10 })
    .withMessage('Invalid token symbol'),
  body('targetPrice')
    .notEmpty()
    .withMessage('Target price is required')
    .isFloat({ min: 0 })
    .withMessage('Target price must be a positive number'),
  body('condition')
    .isIn(['above', 'below'])
    .withMessage('Condition must be either "above" or "below"'),
];


