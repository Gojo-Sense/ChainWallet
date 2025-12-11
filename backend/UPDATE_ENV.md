# Update .env File with Your PostgreSQL Password

The `.env` file needs your actual PostgreSQL password. 

## Steps:

1. Open the `.env` file in the backend directory:
   ```bash
   cd backend
   nano .env
   # or use your preferred editor
   ```

2. Find these lines and update `DB_PASSWORD` with your actual PostgreSQL password:
   ```
   DB_USER=postgres
   DB_PASSWORD=password  <-- Change this to your actual password
   ```

3. Also update the `DATABASE_URL` line:
   ```
   DATABASE_URL=postgresql://postgres:password@localhost:5432/aether_wallet
   ```
   Replace `password` with your actual password:
   ```
   DATABASE_URL=postgresql://postgres:YOUR_PASSWORD@localhost:5432/aether_wallet
   ```

4. Save the file and run migrations:
   ```bash
   npm run migrate
   ```

5. Then start the server:
   ```bash
   npm run dev
   ```

## Example:
If your PostgreSQL password is `mypass123`, your .env should have:
```
DB_PASSWORD=mypass123
DATABASE_URL=postgresql://postgres:mypass123@localhost:5432/aether_wallet
```


