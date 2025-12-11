# Quick Start - Angular Dashboard

## ✅ Everything is Ready!

### Step 1: Start Angular Server

```bash
cd web-admin
npm install  # Only needed first time
ng serve
```

Dashboard will be at: `http://localhost:4200`

### Step 2: Update URL in Flutter (if needed)

**Android Emulator:** Already set to `http://10.0.2.2:4200` ✅

**iOS Simulator:** Change to `http://localhost:4200`

**Physical Device:** 
1. Find your IP: `ifconfig | grep "inet "` (Mac) or `ipconfig` (Windows)
2. Start Angular: `ng serve --host 0.0.0.0`
3. Update URL in `lib/features/admin/presentation/pages/admin_dashboard_page.dart`

### Step 3: Access from Flutter App

1. Run Flutter app: `flutter run`
2. Go to **Settings** tab
3. Scroll to **About** section
4. Tap **"Admin Dashboard 📊"**
5. Dashboard loads! 🎉

## Troubleshooting

**Dashboard not loading?**
- Make sure Angular server is running (`ng serve`)
- Check URL in `admin_dashboard_page.dart`
- Android emulator uses `10.0.2.2`, iOS uses `localhost`

**npm install fails?**
```bash
sudo chown -R $(whoami) ~/.npm
npm install
```

That's it! Enjoy your integrated dashboard! 🚀
