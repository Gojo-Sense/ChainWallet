import { Router } from 'express';
import { TransactionController } from '../controllers/transaction.controller';
import { authenticate } from '../middleware/auth.middleware';
import { apiRateLimiter } from '../middleware/rate-limiter';
import { transactionValidator } from '../utils/validators';
import { handleValidationErrors } from '../utils/validation-result';

const router = Router();

router.use(authenticate);
router.use(apiRateLimiter);

router.get('/', TransactionController.getTransactions);
router.get('/stats', TransactionController.getStats);
router.post('/', transactionValidator, handleValidationErrors, TransactionController.syncTransaction);

export default router;


