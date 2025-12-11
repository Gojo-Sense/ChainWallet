import { Router } from 'express';
import { AuthController } from '../controllers/auth.controller';
import { authenticate } from '../middleware/auth.middleware';
import { authRateLimiter, apiRateLimiter } from '../middleware/rate-limiter';
import {
  registerValidator,
  loginValidator,
  refreshTokenValidator,
} from '../utils/validators';
import { handleValidationErrors } from '../utils/validation-result';

const router = Router();

router.post(
  '/register',
  authRateLimiter,
  registerValidator,
  handleValidationErrors,
  AuthController.register
);

router.post(
  '/login',
  authRateLimiter,
  loginValidator,
  handleValidationErrors,
  AuthController.login
);

router.post(
  '/refresh',
  apiRateLimiter,
  refreshTokenValidator,
  handleValidationErrors,
  AuthController.refresh
);

router.post(
  '/logout',
  apiRateLimiter,
  authenticate,
  AuthController.logout
);

export default router;


