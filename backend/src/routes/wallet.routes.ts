import { Router } from 'express';
import { WalletController } from '../controllers/wallet.controller';
import { authenticate } from '../middleware/auth.middleware';
import { apiRateLimiter } from '../middleware/rate-limiter';
import { walletValidator } from '../utils/validators';
import { handleValidationErrors } from '../utils/validation-result';

const router = Router();

router.use(authenticate);
router.use(apiRateLimiter);

router.get('/', WalletController.getWallets);
router.post('/', walletValidator, handleValidationErrors, WalletController.addWallet);
router.delete('/:id', WalletController.deleteWallet);

export default router;


