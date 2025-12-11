import { syncDatabase } from './database';

const force = process.argv.includes('--force');

syncDatabase(force)
  .then(() => {
    console.log('✅ Database migration completed');
    process.exit(0);
  })
  .catch((error) => {
    console.error('❌ Database migration failed:', error);
    process.exit(1);
  });

