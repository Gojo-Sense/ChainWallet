import { Router } from 'express';
import { PortfolioController } from '../controllers/portfolio.controller';
import { authenticate } from '../middleware/auth.middleware';
import { apiRateLimiter } from '../middleware/rate-limiter';

const router = Router();

router.use(authenticate);
router.use(apiRateLimiter);

router.get('/', PortfolioController.getPortfolio);
router.get('/history', PortfolioController.getHistory);
router.get('/analytics', PortfolioController.getAnalytics);

export default router;


