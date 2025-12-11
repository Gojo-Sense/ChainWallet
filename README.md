# 🌟 Aether Wallet

**The Future of Secure Crypto Storage**

A production-grade crypto wallet app featuring Deep Glassmorphism UI design with OLED optimization, biometric authentication, NFC proximity payments, and holographic QR scanning.

![Aether Wallet](assets/images/.gitkeep)

## ✨ Features

- **Deep Glassmorphism UI** - Stunning visual design with blur effects, neon accents, and OLED-optimized blacks
- **Biometric Lock** - FaceID/TouchID authentication for secure access
- **Pulse Pay** - NFC + Proximity payment system for instant transactions
- **Smart Scanner** - Holographic QR scanner with animated overlay

## 🏗️ Architecture

```
lib/
├── config/          # App configuration (Router, DI)
├── core/
│   ├── constants/   # Colors, Typography, Spacing
│   ├── theme/       # App Theme Engine
│   ├── widgets/     # Reusable Glass Components
│   └── extensions/  # Dart extensions
├── domain/
│   ├── entities/    # Business entities
│   ├── failures/    # Failure types
│   └── repositories/# Repository interfaces
├── data/
│   ├── models/      # Data models
│   └── repositories/# Repository implementations
├── presentation/
│   └── bloc/        # BLoC state management
└── features/
    ├── splash/      # Splash screen
    ├── home/        # Main dashboard
    ├── scan/        # QR Scanner
    └── pulse/       # Pulse Pay
```

## 🛠️ Tech Stack

| Category | Technology |
|----------|------------|
| Framework | Flutter 3.x |
| State Management | flutter_bloc |
| Routing | go_router |
| DI | get_it + injectable |
| Code Gen | freezed + json_serializable |
| FP | fpdart |
| Animations | flutter_animate |
| Biometrics | local_auth |
| Scanner | mobile_scanner |
| NFC | nfc_manager |

## 🚀 Getting Started

### Prerequisites

- Flutter SDK ^3.9.0
- Xcode (for iOS)
- Android Studio (for Android)
- CocoaPods (for iOS dependencies)

### Installation

```bash
# Clone the repository
cd myWallet

# Install dependencies
flutter pub get

# Install iOS pods (macOS only)
cd ios && pod install && cd ..

# Run the app
flutter run
```

### Running on iOS Simulator

```bash
flutter run -d "iPhone 15 Pro"
```

### Running on Android Emulator

```bash
flutter run -d "emulator-5554"
```

## 🎨 Design System

### Colors

| Name | Hex | Usage |
|------|-----|-------|
| Neon Green | `#7CFF00` | Primary accent, CTAs |
| Neon Magenta | `#FF00FF` | Secondary accent |
| Neon Yellow | `#FFE600` | Tertiary accent |
| Abyss | `#000000` | Primary background |
| Charcoal | `#121212` | Secondary background |

### Typography

Font Family: **Outfit**

| Style | Size | Weight |
|-------|------|--------|
| Display Large | 48px | Bold |
| Balance | 42px | Bold |
| Headline Medium | 20px | SemiBold |
| Body Medium | 14px | Regular |

### Glass Components

- `GlassCard` - Blurred glassmorphic card
- `NeonGlassCard` - Glass card with neon border
- `GlassContainer` - Simple glass container
- `NeonButton` - Glowing CTA button
- `HolographicContainer` - Animated holographic border

## 📱 Screens

1. **Splash** - Animated logo reveal with auth check
2. **Home** - Dashboard with balance, portfolio, and quick actions
3. **Scan** - QR scanner with holographic overlay
4. **Pulse** - NFC proximity payment interface

## 🔐 Permissions

### iOS (Info.plist)
- Face ID Usage
- Camera Usage
- NFC Reader Usage
- Photo Library Usage

### Android (AndroidManifest.xml)
- Camera
- NFC
- Biometric

## 📝 Development Phases

- [x] **Phase 1**: Scaffold & Infrastructure
- [ ] **Phase 2**: Domain & Data Layer
- [ ] **Phase 3**: Presentation & State (BLoC)
- [ ] **Phase 4**: Incredible UI
- [ ] **Phase 5**: Pulse Pay Implementation

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

---

Built with 💚 using Flutter
