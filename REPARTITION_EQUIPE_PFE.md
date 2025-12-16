# 📋 Répartition du Projet Aether Wallet - Équipe de 5 Personnes

## Vue d'ensemble

Le projet Aether Wallet est divisé en **5 modules principaux**, chacun attribué à un membre de l'équipe.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        AETHER WALLET - ÉQUIPE PFE                        │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│   👤 Personne 1          👤 Personne 2          👤 Personne 3           │
│   ┌─────────────┐        ┌─────────────┐        ┌─────────────┐         │
│   │  Frontend   │        │   Backend   │        │ Blockchain  │         │
│   │   Mobile    │        │    API      │        │    Web3     │         │
│   │  (Flutter)  │        │  (Node.js)  │        │ (Ethereum)  │         │
│   └─────────────┘        └─────────────┘        └─────────────┘         │
│                                                                          │
│   👤 Personne 4          👤 Personne 5                                  │
│   ┌─────────────┐        ┌─────────────┐                                │
│   │   Auth &    │        │  Marché &   │                                │
│   │  Sécurité   │        │  Alertes    │                                │
│   └─────────────┘        └─────────────┘                                │
│                                                                          │
└─────────────────────────────────────────────────────────────────────────┘
```

---

# 👤 PERSONNE 1 : Frontend Mobile (Flutter/Dart)

## 🎯 Thème : Développement de l'interface utilisateur mobile cross-platform avec Flutter

### Responsabilités

| Aspect | Détails |
|--------|---------|
| **Framework** | Flutter 3.x / Dart |
| **Architecture** | Clean Architecture + BLoC Pattern |
| **Design** | Deep Glassmorphism UI |
| **Plateformes** | iOS, Android, Web, Desktop |

### Fichiers clés à présenter

```
lib/
├── main.dart                           # Point d'entrée
├── config/router.dart                  # Navigation Go Router
├── core/
│   ├── theme/app_theme.dart           # Thème Deep Glassmorphism
│   ├── widgets/                        # Composants réutilisables
│   │   ├── glass_card.dart
│   │   ├── neon_button.dart
│   │   └── holographic_container.dart
│   └── constants/                      # Couleurs, typo, spacing
└── features/
    ├── shell/main_shell.dart          # Navigation principale
    ├── splash/                         # Écran de démarrage
    └── scan/                           # Scanner QR
```

### Points à aborder dans la présentation

1. **Introduction à Flutter**
   - Qu'est-ce que Flutter ?
   - Avantages du cross-platform
   - Compilation native vs interprétée

2. **Architecture de l'application**
   - Clean Architecture (Presentation → Domain → Data)
   - Séparation des responsabilités
   - Structure des features

3. **Design System - Deep Glassmorphism**
   - Palette de couleurs (Neon Green, Magenta, Abyss)
   - Typographie (Inter font family)
   - Composants Glass (GlassCard, NeonButton)
   - Animations (flutter_animate)

4. **Navigation avec Go Router**
   - Routes déclaratives
   - Deep linking
   - Transitions personnalisées

5. **Gestion d'état avec BLoC**
   - Events → BLoC → States
   - Séparation UI/Logique
   - Exemple concret (WalletBloc)

### Diagrammes à inclure

```
┌─────────────────────────────────────────────────────────────────┐
│                    ARCHITECTURE FLUTTER                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│    ┌─────────────────────────────────────────────────────┐      │
│    │                   PRESENTATION                       │      │
│    │  ┌─────────┐    ┌─────────┐    ┌─────────┐         │      │
│    │  │  Pages  │───▶│  BLoCs  │───▶│ Widgets │         │      │
│    │  └─────────┘    └────┬────┘    └─────────┘         │      │
│    └──────────────────────┼──────────────────────────────┘      │
│                           │                                      │
│    ┌──────────────────────┼──────────────────────────────┐      │
│    │                   DOMAIN                             │      │
│    │  ┌─────────┐    ┌────┴────┐    ┌─────────┐         │      │
│    │  │Entities │    │  Repos  │    │Failures │         │      │
│    │  │(Freezed)│    │Interface│    │         │         │      │
│    │  └─────────┘    └────┬────┘    └─────────┘         │      │
│    └──────────────────────┼──────────────────────────────┘      │
│                           │                                      │
│    ┌──────────────────────┼──────────────────────────────┐      │
│    │                    DATA                              │      │
│    │  ┌─────────┐    ┌────┴────┐    ┌─────────┐         │      │
│    │  │ Models  │    │  Repos  │    │DataSrcs │         │      │
│    │  │  (JSON) │    │  Impl   │    │ (APIs)  │         │      │
│    │  └─────────┘    └─────────┘    └─────────┘         │      │
│    └─────────────────────────────────────────────────────┘      │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Technologies à maîtriser

| Package | Version | Rôle |
|---------|---------|------|
| flutter_bloc | ^9.1.0 | Gestion d'état |
| go_router | ^15.1.2 | Navigation |
| freezed | ^3.0.6 | Génération de code |
| flutter_animate | ^4.5.2 | Animations |
| google_fonts | ^6.2.1 | Typographie |
| get_it | ^8.0.3 | Injection de dépendances |

---

# 👤 PERSONNE 2 : Backend API (Node.js/Express)

## 🎯 Thème : Développement de l'API REST et services temps réel avec Node.js

### Responsabilités

| Aspect | Détails |
|--------|---------|
| **Runtime** | Node.js 20.x |
| **Framework** | Express.js |
| **Langage** | TypeScript |
| **Base de données** | PostgreSQL + Redis |
| **Temps réel** | Socket.IO |

### Fichiers clés à présenter

```
backend/
├── src/
│   ├── server.ts                      # Point d'entrée serveur
│   ├── config/
│   │   ├── database.ts               # Configuration PostgreSQL
│   │   ├── redis.ts                  # Configuration Redis
│   │   └── env.ts                    # Variables d'environnement
│   ├── models/
│   │   ├── User.model.ts             # Modèle utilisateur
│   │   ├── Wallet.model.ts           # Modèle portefeuille
│   │   ├── Transaction.model.ts      # Modèle transaction
│   │   └── PriceAlert.model.ts       # Modèle alerte
│   ├── routes/
│   │   ├── auth.routes.ts            # Routes authentification
│   │   ├── wallet.routes.ts          # Routes portefeuilles
│   │   └── alert.routes.ts           # Routes alertes
│   ├── controllers/                   # Logique des endpoints
│   ├── middleware/                    # Auth, validation, erreurs
│   ├── services/                      # Logique métier
│   └── websocket/socket.handler.ts   # WebSocket temps réel
└── package.json
```

### Points à aborder dans la présentation

1. **Introduction à Node.js**
   - Environnement d'exécution JavaScript côté serveur
   - Event Loop et I/O non-bloquant
   - Avantages pour les applications temps réel

2. **Architecture du Backend**
   - Structure MVC (Model-View-Controller)
   - Séparation Routes → Controllers → Services
   - Middleware pattern

3. **Base de données PostgreSQL**
   - Modélisation relationnelle
   - ORM Sequelize
   - Migrations et associations

4. **Cache Redis**
   - Mise en cache des prix
   - Sessions utilisateur
   - Rate limiting

5. **WebSocket avec Socket.IO**
   - Communication bidirectionnelle
   - Channels et rooms
   - Mises à jour temps réel des prix

6. **Sécurité API**
   - Helmet (HTTP headers)
   - CORS
   - Rate limiting
   - Validation des entrées

### Diagrammes à inclure

```
┌─────────────────────────────────────────────────────────────────┐
│                    ARCHITECTURE BACKEND                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   Client (Flutter)                                               │
│        │                                                         │
│        ▼                                                         │
│   ┌─────────────────────────────────────────────────────────┐   │
│   │                    EXPRESS SERVER                        │   │
│   │  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐    │   │
│   │  │ Helmet  │  │  CORS   │  │ Rate    │  │  Auth   │    │   │
│   │  │         │  │         │  │ Limit   │  │  JWT    │    │   │
│   │  └────┬────┘  └────┬────┘  └────┬────┘  └────┬────┘    │   │
│   │       └────────────┴────────────┴────────────┘          │   │
│   │                         │                                │   │
│   │   ┌─────────────────────┼─────────────────────┐         │   │
│   │   │                  ROUTES                    │         │   │
│   │   │  /auth  /wallets  /transactions  /alerts  │         │   │
│   │   └─────────────────────┼─────────────────────┘         │   │
│   │                         │                                │   │
│   │   ┌─────────────────────┼─────────────────────┐         │   │
│   │   │               CONTROLLERS                  │         │   │
│   │   └─────────────────────┼─────────────────────┘         │   │
│   │                         │                                │   │
│   │   ┌─────────────────────┼─────────────────────┐         │   │
│   │   │                SERVICES                    │         │   │
│   │   └─────────────────────┼─────────────────────┘         │   │
│   └─────────────────────────┼───────────────────────────────┘   │
│                             │                                    │
│         ┌───────────────────┼───────────────────┐               │
│         │                   │                   │               │
│         ▼                   ▼                   ▼               │
│   ┌───────────┐      ┌───────────┐      ┌───────────┐          │
│   │PostgreSQL │      │   Redis   │      │ Socket.IO │          │
│   │    DB     │      │   Cache   │      │ WebSocket │          │
│   └───────────┘      └───────────┘      └───────────┘          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### API Endpoints à documenter

| Méthode | Endpoint | Description |
|---------|----------|-------------|
| POST | `/api/auth/register` | Inscription utilisateur |
| POST | `/api/auth/login` | Connexion (retourne JWT) |
| GET | `/api/wallets` | Liste des portefeuilles |
| POST | `/api/wallets` | Créer un portefeuille |
| GET | `/api/transactions` | Historique transactions |
| POST | `/api/alerts` | Créer une alerte prix |
| GET | `/api/portfolio` | Analytics portefeuille |

### Technologies à maîtriser

| Package | Rôle |
|---------|------|
| express | Framework web |
| sequelize | ORM PostgreSQL |
| jsonwebtoken | Authentification JWT |
| bcrypt | Hachage mots de passe |
| socket.io | WebSocket |
| redis | Cache et sessions |
| helmet | Sécurité HTTP |

---

# 👤 PERSONNE 3 : Intégration Blockchain (Ethereum/Web3)

## 🎯 Thème : Intégration de la blockchain Ethereum et opérations crypto

### Responsabilités

| Aspect | Détails |
|--------|---------|
| **Blockchain** | Ethereum Mainnet |
| **Protocole** | JSON-RPC |
| **Librairie** | web3dart |
| **Standards** | BIP39, BIP44 |

### Fichiers clés à présenter

```
lib/
├── core/
│   └── services/
│       └── web3_service.dart          # Service Web3 principal
└── features/
    └── wallet/
        ├── data/
        │   ├── datasources/
        │   │   └── blockchain_datasource.dart
        │   └── repositories/
        │       └── wallet_repository_impl.dart
        └── domain/
            ├── entities/
            │   └── wallet_entity.dart
            └── repositories/
                └── i_wallet_repository.dart
```

### Points à aborder dans la présentation

1. **Introduction à la Blockchain**
   - Qu'est-ce qu'une blockchain ?
   - Décentralisation et consensus
   - Blocs, transactions, et hashes

2. **Ethereum et les Smart Contracts**
   - Ethereum Virtual Machine (EVM)
   - Gas et frais de transaction
   - Adresses et clés (publique/privée)

3. **Génération de portefeuilles (BIP39)**
   - Phrases mnémoniques (12/24 mots)
   - Dérivation de clés
   - Sécurité des seeds

4. **Opérations blockchain**
   - Requête de solde
   - Estimation du gas
   - Signature de transactions
   - Envoi de transactions

5. **Sécurité des clés privées**
   - Stockage sécurisé (flutter_secure_storage)
   - Signature locale (jamais de clé sur le serveur)
   - Chiffrement

### Code clé à expliquer

```dart
// Génération de portefeuille
Future<Either<CoreFailure, WalletEntity>> generateWallet() async {
  try {
    // 1. Générer phrase mnémonique BIP39
    final mnemonic = bip39.generateMnemonic();
    
    // 2. Convertir en seed
    final seed = bip39.mnemonicToSeed(mnemonic);
    
    // 3. Dériver clé privée
    final privateKeyBytes = seed.take(32).toList();
    final privateKey = EthPrivateKey.fromHex(privateKeyHex);
    
    // 4. Obtenir adresse publique
    final address = privateKey.address;
    
    return right(WalletEntity(
      address: address.hex,
      mnemonic: mnemonic,
    ));
  } catch (e) {
    return left(CoreFailure.unexpected(message: e.toString()));
  }
}

// Envoi de transaction
Future<Either<CoreFailure, String>> sendTransaction({
  required EthPrivateKey credentials,
  required EthereumAddress to,
  required EtherAmount value,
}) async {
  // 1. Obtenir nonce
  final nonce = await _client.getTransactionCount(credentials.address);
  
  // 2. Obtenir prix du gas
  final gasPrice = await _client.getGasPrice();
  
  // 3. Estimer gas limit
  final gasLimit = await _client.estimateGas(...);
  
  // 4. Créer et signer transaction
  final transaction = Transaction(
    to: to,
    value: value,
    gasPrice: gasPrice,
    maxGas: gasLimit,
    nonce: nonce,
  );
  
  // 5. Envoyer à la blockchain
  final txHash = await _client.sendTransaction(
    credentials,
    transaction,
    chainId: 1, // Ethereum Mainnet
  );
  
  return right(txHash);
}
```

### Diagrammes à inclure

```
┌─────────────────────────────────────────────────────────────────┐
│                   FLUX DE TRANSACTION ETHEREUM                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌─────────────┐                                               │
│   │ Utilisateur │                                               │
│   │ (App)       │                                               │
│   └──────┬──────┘                                               │
│          │ 1. Saisir destinataire + montant                     │
│          ▼                                                       │
│   ┌─────────────┐                                               │
│   │ Web3Service │                                               │
│   └──────┬──────┘                                               │
│          │ 2. Estimer gas                                        │
│          │ 3. Obtenir nonce                                      │
│          │ 4. Créer transaction                                  │
│          ▼                                                       │
│   ┌─────────────┐                                               │
│   │ Signature   │ ◀── Clé privée (locale)                       │
│   │ locale      │                                               │
│   └──────┬──────┘                                               │
│          │ 5. Transaction signée                                 │
│          ▼                                                       │
│   ┌─────────────────────────────────────────────────────────┐   │
│   │              ETHEREUM MAINNET (RPC)                      │   │
│   │                                                          │   │
│   │   6. Broadcast ──▶ 7. Validation ──▶ 8. Inclusion bloc  │   │
│   │                                                          │   │
│   └──────────────────────────┬──────────────────────────────┘   │
│                              │                                   │
│                              ▼                                   │
│   ┌─────────────┐     ┌─────────────┐                           │
│   │ Transaction │     │   Solde     │                           │
│   │   Receipt   │     │   Mis à     │                           │
│   │   (Hash)    │     │   jour      │                           │
│   └─────────────┘     └─────────────┘                           │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Concepts blockchain à maîtriser

| Concept | Description |
|---------|-------------|
| **Nonce** | Compteur de transactions pour éviter les replay attacks |
| **Gas** | Unité de mesure du coût computationnel |
| **Gas Price** | Prix en Gwei pour chaque unité de gas |
| **Gas Limit** | Maximum de gas autorisé pour la transaction |
| **Chain ID** | Identifiant du réseau (1 = Mainnet) |
| **Private Key** | 256 bits, permet de signer des transactions |
| **Public Address** | Dérivée de la clé publique, commence par 0x |

---

# 👤 PERSONNE 4 : Authentification & Sécurité

## 🎯 Thème : Système d'authentification et sécurité de l'application

### Responsabilités

| Aspect | Détails |
|--------|---------|
| **Auth Backend** | JWT, bcrypt |
| **Auth Mobile** | Biométrie (FaceID/TouchID) |
| **Stockage** | flutter_secure_storage |
| **Sessions** | Redis, Lock screen |

### Fichiers clés à présenter

```
# Backend
backend/src/
├── middleware/
│   └── auth.middleware.ts             # Vérification JWT
├── controllers/
│   └── auth.controller.ts             # Login/Register
├── services/
│   └── auth.service.ts                # Logique auth
└── models/
    ├── User.model.ts                  # Utilisateur
    └── Session.model.ts               # Sessions

# Flutter
lib/features/auth/
├── data/
│   ├── datasources/auth_api.dart      # Appels API auth
│   └── repositories/auth_repository_impl.dart
├── domain/
│   ├── entities/user_entity.dart
│   └── repositories/i_auth_repository.dart
├── presentation/
│   ├── bloc/auth_bloc.dart            # État auth
│   └── pages/
│       ├── login_page.dart            # Écran connexion
│       ├── register_page.dart         # Écran inscription
│       └── lock_screen.dart           # Écran verrouillage

lib/core/services/
└── lock_service.dart                   # Gestion verrouillage
```

### Points à aborder dans la présentation

1. **Authentification par email/mot de passe**
   - Inscription avec validation
   - Hachage des mots de passe (bcrypt)
   - Connexion et vérification

2. **JWT (JSON Web Tokens)**
   - Structure d'un JWT (Header, Payload, Signature)
   - Génération et vérification
   - Expiration et refresh tokens

3. **Authentification biométrique**
   - FaceID (iOS) / Fingerprint (Android)
   - Package local_auth
   - Fallback vers PIN/mot de passe

4. **Lock Screen**
   - Verrouillage automatique en arrière-plan
   - Gestion du lifecycle de l'app
   - Déverrouillage biométrique

5. **Stockage sécurisé des données sensibles**
   - flutter_secure_storage
   - Keychain (iOS) / Keystore (Android)
   - Chiffrement AES-256

6. **Protection contre les attaques**
   - Rate limiting
   - Validation des entrées
   - Protection CSRF/XSS
   - Helmet (HTTP headers)

### Diagrammes à inclure

```
┌─────────────────────────────────────────────────────────────────┐
│                    FLUX D'AUTHENTIFICATION                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│                     ┌─────────────┐                             │
│                     │   Splash    │                             │
│                     │   Screen    │                             │
│                     └──────┬──────┘                             │
│                            │                                     │
│              ┌─────────────┼─────────────┐                      │
│              │             │             │                      │
│              ▼             ▼             ▼                      │
│   ┌─────────────┐  ┌─────────────┐  ┌─────────────┐            │
│   │   Pas de    │  │   Token     │  │   Token     │            │
│   │   Token     │  │   Valide    │  │   Expiré    │            │
│   └──────┬──────┘  └──────┬──────┘  └──────┬──────┘            │
│          │                │                │                     │
│          ▼                ▼                ▼                     │
│   ┌─────────────┐  ┌─────────────┐  ┌─────────────┐            │
│   │   Login     │  │   Lock      │  │   Login     │            │
│   │   Page      │  │   Screen    │  │   Page      │            │
│   └──────┬──────┘  └──────┬──────┘  └─────────────┘            │
│          │                │                                      │
│          ▼                ▼                                      │
│   ┌─────────────┐  ┌─────────────┐                              │
│   │  API Login  │  │  Biometric  │                              │
│   │  (JWT)      │  │    Auth     │                              │
│   └──────┬──────┘  └──────┬──────┘                              │
│          │                │                                      │
│          └────────────────┴─────────────┐                       │
│                                         │                        │
│                                         ▼                        │
│                               ┌─────────────┐                   │
│                               │    Home     │                   │
│                               │   Screen    │                   │
│                               └─────────────┘                   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

```
┌─────────────────────────────────────────────────────────────────┐
│                    STRUCTURE JWT                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.                         │
│   eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0Ijox.│
│   SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c                   │
│                                                                  │
│   ┌─────────────┐  ┌─────────────┐  ┌─────────────┐            │
│   │   HEADER    │  │   PAYLOAD   │  │  SIGNATURE  │            │
│   ├─────────────┤  ├─────────────┤  ├─────────────┤            │
│   │ alg: HS256  │  │ sub: id     │  │ HMACSHA256( │            │
│   │ typ: JWT    │  │ email       │  │   header +  │            │
│   │             │  │ iat: date   │  │   payload,  │            │
│   │             │  │ exp: date   │  │   secret    │            │
│   │             │  │             │  │ )           │            │
│   └─────────────┘  └─────────────┘  └─────────────┘            │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Code clé à expliquer

```typescript
// Backend - Génération JWT
const generateToken = (user: User): string => {
  return jwt.sign(
    { 
      sub: user.id, 
      email: user.email 
    },
    process.env.JWT_SECRET!,
    { expiresIn: '7d' }
  );
};

// Backend - Vérification mot de passe
const verifyPassword = async (password: string, hash: string): Promise<boolean> => {
  return await bcrypt.compare(password, hash);
};
```

```dart
// Flutter - Authentification biométrique
class LockService {
  final LocalAuthentication _localAuth = LocalAuthentication();
  
  Future<bool> authenticateWithBiometrics() async {
    final isAvailable = await _localAuth.canCheckBiometrics;
    if (!isAvailable) return false;
    
    return await _localAuth.authenticate(
      localizedReason: 'Déverrouillez Aether Wallet',
      options: const AuthenticationOptions(
        stickyAuth: true,
        biometricOnly: true,
      ),
    );
  }
}
```

### Bonnes pratiques sécurité

| Pratique | Implémentation |
|----------|----------------|
| Hachage mots de passe | bcrypt avec salt (10 rounds) |
| Stockage tokens | Secure Storage (Keychain/Keystore) |
| HTTPS | Obligatoire en production |
| Expiration JWT | 7 jours max, refresh token |
| Rate limiting | 100 req/15min par IP |
| Validation entrées | express-validator |

---

# 👤 PERSONNE 5 : Marché & Système d'Alertes

## 🎯 Thème : Données de marché en temps réel et système de notifications d'alertes

### Responsabilités

| Aspect | Détails |
|--------|---------|
| **APIs Marché** | CoinGecko, Binance WebSocket |
| **Graphiques** | fl_chart |
| **Alertes** | CRUD + vérification périodique |
| **Notifications** | flutter_local_notifications |

### Fichiers clés à présenter

```
lib/features/
├── market/
│   ├── data/
│   │   ├── datasources/
│   │   │   ├── coingecko_api.dart       # API CoinGecko
│   │   │   └── binance_websocket_api.dart # WebSocket Binance
│   │   └── repositories/
│   │       └── market_repository_impl.dart
│   ├── domain/
│   │   └── entities/token_entity.dart
│   └── presentation/
│       ├── bloc/market_bloc.dart
│       ├── pages/
│       │   ├── market_page.dart          # Liste tokens
│       │   └── token_detail_page.dart    # Détail + graphe
│       └── widgets/
│           ├── token_list_tile.dart
│           └── price_chart.dart
│
└── alerts/
    ├── data/
    │   └── repositories/alert_repository_impl.dart
    ├── domain/
    │   ├── entities/alert_entity.dart
    │   └── services/
    │       └── alert_checker_service.dart  # Vérification périodique
    └── presentation/
        ├── bloc/alert_bloc.dart
        ├── pages/alerts_page.dart
        └── widgets/create_alert_sheet.dart
```

### Points à aborder dans la présentation

1. **API CoinGecko**
   - Endpoints utilisés (markets, coins/{id})
   - Données récupérées (prix, market cap, volume)
   - Gestion du rate limiting
   - Cache local (Hive)

2. **WebSocket Binance**
   - Connexion temps réel
   - Streams de prix
   - Gestion des reconnexions

3. **Affichage des graphiques**
   - Package fl_chart
   - Données historiques (1H, 24H, 7D, 30D)
   - Interactivité (touch, zoom)

4. **Système d'alertes**
   - Création d'alertes (token, prix, condition)
   - Stockage backend
   - Vérification périodique (Timer)
   - Déclenchement et notification

5. **Notifications locales**
   - Configuration multi-plateforme
   - Canaux de notification (Android)
   - Actions sur notification

### Diagrammes à inclure

```
┌─────────────────────────────────────────────────────────────────┐
│                    FLUX DONNÉES MARCHÉ                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌─────────────┐          ┌─────────────┐                      │
│   │  CoinGecko  │          │   Binance   │                      │
│   │    API      │          │  WebSocket  │                      │
│   │   (REST)    │          │ (Real-time) │                      │
│   └──────┬──────┘          └──────┬──────┘                      │
│          │                        │                              │
│          │ Prix, MarketCap        │ Prix live                   │
│          │ Volume, Sparkline      │                              │
│          │                        │                              │
│          └────────────┬───────────┘                             │
│                       │                                          │
│                       ▼                                          │
│          ┌─────────────────────────┐                            │
│          │    MarketRepository     │                            │
│          │                         │                            │
│          │  - fetchTokens()        │                            │
│          │  - getTokenDetail()     │                            │
│          │  - subscribeToPrice()   │                            │
│          └───────────┬─────────────┘                            │
│                      │                                           │
│        ┌─────────────┼─────────────┐                            │
│        │             │             │                            │
│        ▼             ▼             ▼                            │
│  ┌───────────┐ ┌───────────┐ ┌───────────┐                     │
│  │   Hive    │ │  Market   │ │  Token    │                     │
│  │   Cache   │ │   BLoC    │ │  Detail   │                     │
│  └───────────┘ └───────────┘ └───────────┘                     │
│                      │             │                             │
│                      ▼             ▼                             │
│               ┌───────────┐ ┌───────────┐                       │
│               │  Market   │ │   Chart   │                       │
│               │   Page    │ │   Page    │                       │
│               └───────────┘ └───────────┘                       │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

```
┌─────────────────────────────────────────────────────────────────┐
│                    SYSTÈME D'ALERTES                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   1. CRÉATION                                                    │
│   ┌─────────────┐     ┌─────────────┐     ┌─────────────┐       │
│   │ Utilisateur │────▶│ AlertBloc   │────▶│  Backend    │       │
│   │ (Créer)     │     │ CreateAlert │     │  POST /api  │       │
│   └─────────────┘     └─────────────┘     └─────────────┘       │
│                                                                  │
│   2. VÉRIFICATION PÉRIODIQUE (toutes les minutes)               │
│   ┌─────────────┐     ┌─────────────┐     ┌─────────────┐       │
│   │   Timer     │────▶│AlertChecker │────▶│ Comparer    │       │
│   │  (1 min)    │     │  Service    │     │ prix actuel │       │
│   └─────────────┘     └─────────────┘     └──────┬──────┘       │
│                                                   │              │
│                              ┌────────────────────┴─────┐        │
│                              │                          │        │
│                              ▼                          ▼        │
│                    ┌─────────────┐            ┌─────────────┐   │
│                    │ Condition   │            │ Condition   │   │
│                    │   FAUSSE    │            │   VRAIE     │   │
│                    │ (attendre)  │            │ (déclencher)│   │
│                    └─────────────┘            └──────┬──────┘   │
│                                                      │           │
│                                                      ▼           │
│   3. NOTIFICATION                           ┌─────────────┐     │
│   ┌─────────────┐     ┌─────────────┐      │  Marquer    │     │
│   │    Push     │◀────│ Notification │◀─────│  triggered  │     │
│   │   Notify    │     │   Service    │      │             │     │
│   └─────────────┘     └─────────────┘      └─────────────┘     │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Code clé à expliquer

```dart
// Récupération des données de marché
class MarketRepositoryImpl implements IMarketRepository {
  final CoinGeckoApi _api;
  final Box _cache;
  
  @override
  Future<Either<MarketFailure, List<TokenEntity>>> getTopTokens() async {
    try {
      // Vérifier cache d'abord
      final cached = _cache.get('top_tokens');
      if (cached != null && !_isExpired(cached)) {
        return right(_parseTokens(cached));
      }
      
      // Sinon, appeler API
      final response = await _api.getMarkets(
        vsCurrency: 'usd',
        order: 'market_cap_desc',
        perPage: 100,
        sparkline: true,
      );
      
      // Mettre en cache
      await _cache.put('top_tokens', response);
      
      return right(_parseTokens(response));
    } catch (e) {
      return left(MarketFailure.network(message: e.toString()));
    }
  }
}

// Service de vérification des alertes
class AlertCheckerService {
  Timer? _timer;
  
  void startPeriodicChecking() {
    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => _checkAllAlerts(),
    );
  }
  
  Future<void> _checkAllAlerts() async {
    final alerts = await _alertRepository.getActiveAlerts();
    
    for (final alert in alerts) {
      final currentPrice = await _marketRepository.getPrice(alert.tokenId);
      
      final shouldTrigger = alert.condition == AlertCondition.above
          ? currentPrice >= alert.targetPrice
          : currentPrice <= alert.targetPrice;
      
      if (shouldTrigger) {
        await _triggerAlert(alert, currentPrice);
      }
    }
  }
  
  Future<void> _triggerAlert(AlertEntity alert, double price) async {
    // Marquer comme déclenchée
    await _alertRepository.markTriggered(alert.id);
    
    // Envoyer notification
    await _notificationService.showAlert(
      title: '🚨 Alerte Prix ${alert.tokenSymbol}',
      body: 'Le prix a atteint ${price.toStringAsFixed(2)} USD',
    );
  }
}
```

### Structure des entités

```dart
@freezed
class TokenEntity with _$TokenEntity {
  const factory TokenEntity({
    required String id,
    required String symbol,
    required String name,
    required double currentPrice,
    required double priceChangePercentage24h,
    required double marketCap,
    required double totalVolume,
    List<double>? sparklineData,
    String? imageUrl,
  }) = _TokenEntity;
}

@freezed
class AlertEntity with _$AlertEntity {
  const factory AlertEntity({
    required String id,
    required String userId,
    required String tokenId,
    required String tokenSymbol,
    required double targetPrice,
    required AlertCondition condition, // above, below
    required bool isActive,
    DateTime? triggeredAt,
    required DateTime createdAt,
  }) = _AlertEntity;
}
```

---

# 📊 Tableau récapitulatif

| Personne | Module | Technologies principales | Durée estimée présentation |
|----------|--------|-------------------------|---------------------------|
| **1** | Frontend Mobile | Flutter, Dart, BLoC, Freezed | 15-20 min |
| **2** | Backend API | Node.js, Express, PostgreSQL, Redis | 15-20 min |
| **3** | Blockchain | Ethereum, web3dart, BIP39 | 15-20 min |
| **4** | Auth & Sécurité | JWT, bcrypt, Biométrie, Secure Storage | 15-20 min |
| **5** | Marché & Alertes | CoinGecko, WebSocket, fl_chart, Notifications | 15-20 min |

---

# 🎯 Conseils pour la présentation

## Pour chaque personne :

1. **Introduction** (2 min)
   - Présenter le module et son importance dans l'app
   - Objectifs et fonctionnalités couvertes

2. **Architecture** (3 min)
   - Montrer les diagrammes
   - Expliquer les choix techniques

3. **Démonstration technique** (5-7 min)
   - Montrer le code clé
   - Expliquer les patterns utilisés
   - Montrer les fichiers importants

4. **Démo live** (3-5 min)
   - Montrer la fonctionnalité en action
   - Cas d'utilisation réels

5. **Défis et solutions** (2 min)
   - Problèmes rencontrés
   - Solutions implémentées

6. **Conclusion** (1 min)
   - Résumer les points clés
   - Lien avec les autres modules

---

**Bonne chance pour votre soutenance ! 🚀**















