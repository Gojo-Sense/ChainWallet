# Admin Dashboard - Angular Application

Angular-based admin dashboard for Aether Wallet, accessible from the Flutter mobile app via WebView.

## Features

- **Deep Glassmorphism Design** - Matching the Flutter app's aesthetic
- **Financial Dashboard** - Overview cards, statistics charts, payment tracking
- **Responsive Layout** - Three-column layout with sidebar navigation
- **Real-time Data** - Ready for API integration

## Project Structure

```
web-admin/
├── src/
│   ├── app/
│   │   ├── components/
│   │   │   └── dashboard/
│   │   │       ├── dashboard.component.ts
│   │   │       ├── dashboard.component.html
│   │   │       └── dashboard.component.css
│   │   └── app.ts
│   ├── styles.css
│   └── index.html
└── package.json
```

## Getting Started

### Prerequisites

- Node.js (v18 or higher)
- npm or yarn
- Angular CLI: `npm install -g @angular/cli`

### Installation

1. Install dependencies:
```bash
cd web-admin
npm install
```

**Note:** If you encounter npm cache permission issues, run:
```bash
sudo chown -R $(whoami) ~/.npm
```

2. Start the development server:
```bash
ng serve
# or
npm start
```

The dashboard will be available at `http://localhost:4200`

### For Android Emulator

When running Flutter app on Android emulator, use:
```
http://10.0.2.2:4200
```

This is because Android emulator maps `localhost` to `10.0.2.2`

### For iOS Simulator

When running Flutter app on iOS simulator, use:
```
http://localhost:4200
```

## Integration with Flutter

The Angular dashboard is loaded in a WebView from the Flutter app:

1. **Access from Flutter**: Settings → Admin Dashboard
2. **WebView URL**: Configured in `lib/features/admin/presentation/pages/admin_dashboard_page.dart`
3. **Default URL**: `http://10.0.2.2:4200` (Android) or `http://localhost:4200` (iOS)

## Dashboard Sections

### Left Sidebar
- Navigation menu with icons
- Logo/branding

### Main Content
- **Overview Cards**: Earning and Spending metrics
- **Statistics Chart**: Weekly/Monthly/Yearly view with interactive bars
- **Monthly Payments**: List of upcoming bills with pay buttons
- **Credit Card**: Visual card display with balance
- **Marketplace**: Connected services management

### Right Sidebar
- **User Profile**: Name and email
- **Total Balance**: Main balance display with percentage change
- **Action Buttons**: Send and Receive
- **Quick Transfer**: Contact avatars
- **Notifications**: Recent activity and alerts

## Building for Production

```bash
ng build --configuration production
```

Output will be in `dist/` directory. You can deploy this to:
- Firebase Hosting
- Vercel
- Netlify
- Any static hosting service

Then update the WebView URL in Flutter to point to your production URL.

## Customization

### Colors

Edit `src/styles.css` to modify color variables:
```css
:root {
  --abyss: #000000;
  --neon-green: #7CFF00;
  --neon-purple: #8B5CF6;
  /* ... */
}
```

### Data

Modify `dashboard.component.ts` to:
- Connect to API endpoints
- Fetch real transaction data
- Update chart data dynamically

## Troubleshooting

### Dashboard not loading in Flutter WebView

1. **Check Angular server is running**: `ng serve`
2. **Verify URL in Flutter**: Check `admin_dashboard_page.dart`
3. **Check device/emulator**: Android uses `10.0.2.2`, iOS uses `localhost`
4. **Network permissions**: Ensure app has internet permission

### CORS Issues

If connecting to APIs, configure CORS in your backend or use Angular proxy:
```json
// angular.json
"serve": {
  "options": {
    "proxyConfig": "proxy.conf.json"
  }
}
```

## Development Notes

- Angular 19 (standalone components)
- TypeScript 5.x
- CSS3 with glassmorphism effects
- No external UI libraries (pure CSS)

## License

Same as main Aether Wallet project.
