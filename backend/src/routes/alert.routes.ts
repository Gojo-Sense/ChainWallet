import { Router } from 'express';
import { AlertController } from '../controllers/alert.controller';
import { authenticate } from '../middleware/auth.middleware';
import { apiRateLimiter } from '../middleware/rate-limiter';
import { priceAlertValidator } from '../utils/validators';
import { handleValidationErrors } from '../utils/validation-result';

const router = Router();

router.use(authenticate);
router.use(apiRateLimiter);

router.get('/', AlertController.getAlerts);
router.post('/', priceAlertValidator, handleValidationErrors, AlertController.createAlert);
router.put('/:id', AlertController.updateAlert);
router.delete('/:id', AlertController.deleteAlert);

export default router;


