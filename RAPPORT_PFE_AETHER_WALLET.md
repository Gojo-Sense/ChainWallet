# Aether Wallet

## INGÉNIERIE INFORMATIQUE & DÉVELOPPEMENT MOBILE

ANNÉE UNIVERSITAIRE
2024-2025

---

## PROJET DE FIN D'ÉTUDES

## THÈME

**Conception et réalisation d'une application mobile de portefeuille crypto-monnaie multi-plateforme avec intégration blockchain Ethereum et interface Deep Glassmorphism**

---

RÉALISÉ PAR : **Mohamed FATIHE**

ENCADRÉ PAR : *(À compléter)*

---

# Dédicaces

*À nos chers parents*

Que ce modeste travail soit l'exaucement de vos vœux tant formulés, le fruit de vos innombrables sacrifices, bien que nous ne vous en acquitterons jamais assez.

*À mes chers amis*

À mes amis pour leur sympathie, fidélité et soutien tout au long de ce projet.

*À nos chers professeurs*

Ce projet n'aurait probablement pas la forme actuelle sans l'aide de nos professeurs qui nous ont guidés et conseillés.

---

# Remerciements

Je tiens tout d'abord à remercier tout le corps enseignant de mon établissement, qui m'a accompagné tout au long de ma formation académique.

Je souhaiterais remercier particulièrement toutes les personnes qui m'ont épaulé et conseillé durant la réalisation de ce projet, et qui m'ont transmis leur expertise dans le domaine du développement mobile et de la blockchain.

Ce projet de fin d'études m'a permis d'acquérir des compétences précieuses dans le développement d'applications mobiles cross-platform, l'intégration blockchain, et l'architecture logicielle moderne.

Je n'oublie pas non plus mes proches qui m'ont sans cesse soutenu dans l'élaboration de ce projet et m'ont aidé à chaque étape de sa réalisation.

---

# Abstract

This end-of-studies project presents the design and implementation of **Aether Wallet**, a production-grade cryptocurrency wallet application developed using Flutter for cross-platform mobile deployment, with real Ethereum blockchain integration.

The application features a sophisticated **Deep Glassmorphism** user interface design with OLED optimization, providing an immersive and modern user experience. Key functional modules include:

- **Wallet Management**: Generation and import of Ethereum wallets using BIP39 mnemonic phrases
- **Blockchain Integration**: Real-time connection to Ethereum Mainnet for balance queries and transaction signing
- **Market Data**: Live cryptocurrency price feeds and charts via CoinGecko and Binance WebSocket APIs
- **QR Scanner**: Holographic-styled camera scanner for wallet addresses
- **Price Alerts**: Customizable cryptocurrency price monitoring system
- **Portfolio Analytics**: Comprehensive tracking of cryptocurrency holdings
- **NFT Gallery**: Display and management of NFT collections
- **AI Chat Assistant**: Integrated cryptocurrency guidance chatbot

The technical environment includes **Flutter/Dart** for the mobile frontend, **Node.js/Express/TypeScript** for the backend API, **PostgreSQL** for data persistence, **Redis** for caching, and **Angular** for the admin dashboard. The architecture follows **Clean Architecture** principles with **BLoC** state management pattern.

**Keywords**: Cryptocurrency Wallet, Flutter, Ethereum, Blockchain, Clean Architecture, BLoC, Deep Glassmorphism, Web3, Mobile Development

---

# Résumé

Ce projet de fin d'études présente la conception et la réalisation de **Aether Wallet**, une application de portefeuille de crypto-monnaies de niveau production, développée avec Flutter pour un déploiement mobile multi-plateforme, avec une intégration réelle à la blockchain Ethereum.

L'application présente une interface utilisateur sophistiquée de type **Deep Glassmorphism** avec optimisation OLED, offrant une expérience utilisateur immersive et moderne. Les modules fonctionnels clés comprennent :

- **Gestion des portefeuilles** : Génération et importation de portefeuilles Ethereum utilisant les phrases mnémoniques BIP39
- **Intégration Blockchain** : Connexion en temps réel au réseau principal Ethereum pour les requêtes de solde et la signature de transactions
- **Données de marché** : Flux de prix de crypto-monnaies en temps réel et graphiques via les APIs CoinGecko et Binance WebSocket
- **Scanner QR** : Scanner caméra avec style holographique pour les adresses de portefeuille
- **Alertes de prix** : Système de surveillance des prix de crypto-monnaies personnalisable
- **Analytique de portefeuille** : Suivi complet des avoirs en crypto-monnaies
- **Galerie NFT** : Affichage et gestion des collections NFT
- **Assistant Chat IA** : Chatbot d'orientation crypto-monnaie intégré

L'environnement technique comprend **Flutter/Dart** pour le frontend mobile, **Node.js/Express/TypeScript** pour l'API backend, **PostgreSQL** pour la persistance des données, **Redis** pour la mise en cache, et **Angular** pour le tableau de bord administrateur. L'architecture suit les principes de **Clean Architecture** avec le pattern de gestion d'état **BLoC**.

**Mots clés** : Portefeuille Crypto-monnaie, Flutter, Ethereum, Blockchain, Clean Architecture, BLoC, Deep Glassmorphism, Web3, Développement Mobile

---

# Table des matières

1. **Contexte général du projet** ..... 1
   - 1.1 Introduction ..... 1
   - 1.2 Présentation du projet ..... 1
   - 1.3 Problématique ..... 2
   - 1.4 Objectifs du projet ..... 3
   - 1.5 Périmètre du projet ..... 4
   - 1.6 Processus de développement ..... 5
   - 1.7 Conclusion ..... 7

2. **Analyse et Conception** ..... 8
   - 2.1 Introduction ..... 8
   - 2.2 Modélisation UML ..... 8
   - 2.3 Diagrammes de cas d'utilisation ..... 9
   - 2.4 Diagrammes de séquence ..... 14
   - 2.5 Diagramme de classes ..... 20
   - 2.6 Architecture de l'application ..... 23
   - 2.7 Conclusion ..... 26

3. **Technologies et outils de développement** ..... 27
   - 3.1 Introduction ..... 27
   - 3.2 Technologies Frontend Mobile ..... 27
   - 3.3 Technologies Backend ..... 32
   - 3.4 Technologies Blockchain ..... 35
   - 3.5 Outils de développement ..... 37
   - 3.6 Conclusion ..... 39

4. **Réalisation de l'application** ..... 40
   - 4.1 Introduction ..... 40
   - 4.2 Structure du projet ..... 40
   - 4.3 Interfaces utilisateur ..... 42
   - 4.4 Fonctionnalités implémentées ..... 48
   - 4.5 Tests et validation ..... 52
   - 4.6 Conclusion ..... 53

5. **Conclusion générale** ..... 54

6. **Bibliographie** ..... 56

---

# Table des figures

- Figure 1.1 : Logo Aether Wallet ..... 1
- Figure 1.2 : Diagramme de Gantt du projet ..... 6
- Figure 2.1 : Diagramme de cas d'utilisation - Gestion des portefeuilles ..... 10
- Figure 2.2 : Diagramme de cas d'utilisation - Transactions ..... 11
- Figure 2.3 : Diagramme de cas d'utilisation - Marché ..... 12
- Figure 2.4 : Diagramme de cas d'utilisation - Alertes ..... 13
- Figure 2.5 : Diagramme de séquence - Création de portefeuille ..... 15
- Figure 2.6 : Diagramme de séquence - Envoi de transaction ..... 16
- Figure 2.7 : Diagramme de séquence - Authentification ..... 17
- Figure 2.8 : Diagramme de séquence - Consultation du marché ..... 18
- Figure 2.9 : Diagramme de séquence - Création d'alerte de prix ..... 19
- Figure 2.10 : Diagramme de classes - Entités du domaine ..... 21
- Figure 2.11 : Diagramme de classes - Backend ..... 22
- Figure 2.12 : Architecture Clean Architecture ..... 24
- Figure 2.13 : Architecture globale du système ..... 25
- Figure 3.1 : Logo Flutter ..... 28
- Figure 3.2 : Pattern BLoC ..... 30
- Figure 3.3 : Logo Node.js ..... 33
- Figure 3.4 : Logo PostgreSQL ..... 34
- Figure 3.5 : Logo Ethereum ..... 36
- Figure 4.1 : Écran Splash ..... 43
- Figure 4.2 : Écran de connexion ..... 44
- Figure 4.3 : Dashboard principal ..... 45
- Figure 4.4 : Scanner QR holographique ..... 46
- Figure 4.5 : Écran du marché ..... 47
- Figure 4.6 : Détail d'un token ..... 48

---

# Chapitre 1 : Contexte général du projet

## 1.1 Introduction

La révolution des crypto-monnaies et de la technologie blockchain a transformé la façon dont nous concevons les transactions financières et la propriété numérique. Depuis l'apparition du Bitcoin en 2009, l'écosystème des crypto-monnaies s'est considérablement développé, avec l'émergence de milliers de tokens et de protocoles décentralisés.

Dans ce contexte, le besoin d'applications de portefeuille crypto sécurisées, intuitives et fonctionnelles est devenu primordial. C'est dans cette optique que le projet **Aether Wallet** a été conçu et développé.

## 1.2 Présentation du projet

### 1.2.1 Vision du projet

**Aether Wallet** est une application mobile de portefeuille de crypto-monnaies de niveau production, conçue pour offrir une expérience utilisateur exceptionnelle tout en garantissant la sécurité des actifs numériques des utilisateurs.

Le nom "Aether" fait référence à l'élément mystique considéré par les anciens Grecs comme la substance composant le ciel et les étoiles, symbolisant ainsi la nature éthérée et immatérielle des actifs numériques.

### 1.2.2 Caractéristiques principales

| Fonctionnalité | Description |
|----------------|-------------|
| **Deep Glassmorphism UI** | Design visuel époustouflant avec effets de flou, accents néon et noirs optimisés OLED |
| **Authentification biométrique** | Sécurité FaceID/TouchID pour un accès sécurisé |
| **Intégration Ethereum** | Connexion au réseau principal Ethereum pour des opérations réelles |
| **Scanner QR intelligent** | Scanner holographique avec overlay animé |
| **Données de marché en temps réel** | Prix et graphiques via WebSocket |
| **Système d'alertes** | Notifications de prix personnalisables |

### 1.2.3 Plateformes cibles

L'application est développée avec **Flutter**, permettant un déploiement sur :
- **iOS** (iPhone, iPad)
- **Android** (smartphones et tablettes)
- **Web** (navigateurs modernes)
- **Desktop** (macOS, Windows, Linux)

## 1.3 Problématique

Le développement d'une application de portefeuille crypto-monnaie moderne fait face à plusieurs défis majeurs :

### 1.3.1 Défis de sécurité

- **Stockage sécurisé des clés privées** : Les clés privées donnent accès total aux fonds, elles doivent être stockées de manière ultra-sécurisée
- **Protection contre les attaques** : Phishing, man-in-the-middle, keyloggers
- **Authentification robuste** : Vérification de l'identité de l'utilisateur

### 1.3.2 Défis d'expérience utilisateur

- **Complexité de la blockchain** : Rendre accessible une technologie complexe
- **Temps de transaction** : Gestion des confirmations et des délais
- **Frais de gas** : Estimation et explication des coûts

### 1.3.3 Défis techniques

- **Multi-plateforme** : Code unique pour toutes les plateformes
- **Performance** : Animations fluides et réactivité
- **Connectivité** : Gestion des états hors ligne
- **Scalabilité** : Architecture évolutive

## 1.4 Objectifs du projet

### 1.4.1 Objectifs fonctionnels

1. **Gestion des portefeuilles**
   - Création de nouveaux portefeuilles avec phrases mnémoniques BIP39
   - Importation de portefeuilles existants
   - Support multi-adresses

2. **Opérations blockchain**
   - Consultation des soldes en temps réel
   - Envoi et réception de transactions
   - Estimation des frais de gas
   - Historique des transactions

3. **Suivi du marché**
   - Prix en temps réel via WebSocket
   - Graphiques interactifs
   - Watchlist personnalisable

4. **Système d'alertes**
   - Alertes de prix personnalisables
   - Notifications push
   - Gestion des alertes actives

5. **Fonctionnalités avancées**
   - Portfolio analytics
   - Galerie NFT
   - Assistant IA intégré
   - Scanner QR intelligent

### 1.4.2 Objectifs non-fonctionnels

| Critère | Objectif |
|---------|----------|
| **Performance** | Temps de démarrage < 3s, animations 60 FPS |
| **Sécurité** | Chiffrement AES-256, authentification biométrique |
| **Disponibilité** | 99.9% uptime du backend |
| **Maintenabilité** | Architecture modulaire, couverture de tests > 80% |

## 1.5 Périmètre du projet

### 1.5.1 Modules fonctionnels

```
┌─────────────────────────────────────────────────────────────────┐
│                        AETHER WALLET                             │
├─────────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐              │
│  │   Wallet    │  │   Market    │  │   Alerts    │              │
│  │ Management  │  │    Data     │  │   System    │              │
│  └─────────────┘  └─────────────┘  └─────────────┘              │
│                                                                  │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐              │
│  │ Transaction │  │  Portfolio  │  │    NFT      │              │
│  │   History   │  │  Analytics  │  │   Gallery   │              │
│  └─────────────┘  └─────────────┘  └─────────────┘              │
│                                                                  │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐              │
│  │     QR      │  │     AI      │  │   Admin     │              │
│  │   Scanner   │  │    Chat     │  │  Dashboard  │              │
│  └─────────────┘  └─────────────┘  └─────────────┘              │
└─────────────────────────────────────────────────────────────────┘
```

### 1.5.2 Nombre de cas d'utilisation par module

| Module | Nombre de cas d'utilisation |
|--------|----------------------------|
| Authentification | 4 |
| Gestion des portefeuilles | 5 |
| Transactions | 4 |
| Marché | 4 |
| Alertes | 4 |
| Portfolio | 3 |
| NFT | 3 |
| Chat IA | 2 |
| **Total** | **29** |

## 1.6 Processus de développement

### 1.6.1 Méthodologie Agile

Le projet a été développé en suivant une méthodologie Agile adaptée, permettant une livraison itérative et incrémentale des fonctionnalités.

```
     ┌─────────┐
     │ Product │
     │ Backlog │
     └────┬────┘
          │
          ▼
    ┌───────────┐     ┌──────────┐     ┌─────────┐
    │  Sprint   │────▶│  Daily   │────▶│  Sprint │
    │ Planning  │     │  Standup │     │ Review  │
    └───────────┘     └──────────┘     └─────────┘
          │                                  │
          │         ┌──────────┐             │
          └────────▶│Development│◀───────────┘
                    └──────────┘
```

### 1.6.2 Phases de développement

| Phase | Description | Durée estimée |
|-------|-------------|---------------|
| **Phase 1** | Infrastructure & Scaffold | 2 semaines |
| **Phase 2** | Domain & Data Layer | 3 semaines |
| **Phase 3** | Presentation & State (BLoC) | 3 semaines |
| **Phase 4** | UI Deep Glassmorphism | 2 semaines |
| **Phase 5** | Intégration Blockchain | 3 semaines |
| **Phase 6** | Tests & Déploiement | 2 semaines |

### 1.6.3 Planning prévisionnel

```
Phase 1: ████░░░░░░░░░░░░░░░░░░░░ (Semaines 1-2)
Phase 2: ░░░░████████░░░░░░░░░░░░ (Semaines 3-5)
Phase 3: ░░░░░░░░░░░░████████░░░░ (Semaines 6-8)
Phase 4: ░░░░░░░░░░░░░░░░░░░░████ (Semaines 9-10)
Phase 5: ░░░░░░░░░░░░░░░░░░░░░░░░ (Semaines 11-13)
Phase 6: ░░░░░░░░░░░░░░░░░░░░░░░░ (Semaines 14-15)
```

## 1.7 Conclusion

Ce chapitre a présenté le contexte général du projet Aether Wallet, une application de portefeuille crypto-monnaie innovante qui combine sécurité, performance et design moderne. La problématique a été clairement définie, les objectifs établis, et le périmètre du projet délimité. Le chapitre suivant abordera l'analyse et la conception détaillées du système.

---

# Chapitre 2 : Analyse et Conception

## 2.1 Introduction

Ce chapitre présente l'analyse et la conception du système Aether Wallet. Nous utiliserons le langage de modélisation UML (Unified Modeling Language) pour représenter les différents aspects du système, incluant les cas d'utilisation, les séquences d'interactions, et la structure des classes.

## 2.2 Modélisation UML

### 2.2.1 Définition

UML (Unified Modeling Language) est un langage de modélisation graphique standardisé utilisé pour visualiser, spécifier, construire et documenter les artefacts d'un système logiciel. Dans le cadre de ce projet, nous utiliserons les diagrammes suivants :

- **Diagrammes de cas d'utilisation** : Représentation des fonctionnalités du système du point de vue de l'utilisateur
- **Diagrammes de séquence** : Illustration des interactions entre les objets au fil du temps
- **Diagrammes de classes** : Structure statique du système

## 2.3 Diagrammes de cas d'utilisation

### 2.3.1 Acteurs du système

| Acteur | Description |
|--------|-------------|
| **Utilisateur** | Personne utilisant l'application pour gérer ses crypto-monnaies |
| **Administrateur** | Personne ayant accès au tableau de bord d'administration |
| **Système Blockchain** | Réseau Ethereum pour les opérations blockchain |
| **API Marché** | Services externes fournissant les données de prix |

### 2.3.2 Module Authentification

```
┌─────────────────────────────────────────────────────────────────┐
│                     Module Authentification                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│    ┌─────────────┐                                              │
│    │ Utilisateur │                                              │
│    └──────┬──────┘                                              │
│           │                                                      │
│           ├──────────────▶ (S'inscrire)                         │
│           │                                                      │
│           ├──────────────▶ (Se connecter)                       │
│           │                                                      │
│           ├──────────────▶ (Authentification biométrique)       │
│           │                                                      │
│           └──────────────▶ (Se déconnecter)                     │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

**Cas d'utilisation détaillés :**

| ID | Cas d'utilisation | Description |
|----|-------------------|-------------|
| UC-AUTH-01 | S'inscrire | L'utilisateur crée un nouveau compte avec email et mot de passe |
| UC-AUTH-02 | Se connecter | L'utilisateur s'authentifie avec ses identifiants |
| UC-AUTH-03 | Authentification biométrique | L'utilisateur déverrouille l'app via FaceID/TouchID |
| UC-AUTH-04 | Se déconnecter | L'utilisateur termine sa session |

### 2.3.3 Module Gestion des Portefeuilles

```
┌─────────────────────────────────────────────────────────────────┐
│                   Module Gestion Portefeuilles                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│    ┌─────────────┐                                              │
│    │ Utilisateur │                                              │
│    └──────┬──────┘                                              │
│           │                                                      │
│           ├──────────────▶ (Créer un portefeuille)              │
│           │                    │                                 │
│           │                    └──extends──▶ (Générer mnemonic) │
│           │                                                      │
│           ├──────────────▶ (Importer un portefeuille)           │
│           │                                                      │
│           ├──────────────▶ (Consulter le solde)                 │
│           │                    │                                 │
│           │                    └──────────▶ [Blockchain ETH]    │
│           │                                                      │
│           ├──────────────▶ (Afficher l'adresse)                 │
│           │                                                      │
│           └──────────────▶ (Exporter la phrase de récupération) │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

**Cas d'utilisation détaillés :**

| ID | Cas d'utilisation | Acteur | Préconditions | Description |
|----|-------------------|--------|---------------|-------------|
| UC-WAL-01 | Créer un portefeuille | Utilisateur | Connecté | Génération d'un nouveau portefeuille avec phrase mnémonique BIP39 de 12 mots |
| UC-WAL-02 | Importer un portefeuille | Utilisateur | Connecté | Importation via phrase mnémonique existante |
| UC-WAL-03 | Consulter le solde | Utilisateur | Portefeuille créé | Requête blockchain pour obtenir le solde ETH |
| UC-WAL-04 | Afficher l'adresse | Utilisateur | Portefeuille créé | Affichage de l'adresse publique et QR code |
| UC-WAL-05 | Exporter phrase | Utilisateur | Auth biométrique | Affichage sécurisé de la phrase de récupération |

### 2.3.4 Module Transactions

```
┌─────────────────────────────────────────────────────────────────┐
│                      Module Transactions                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│    ┌─────────────┐                      ┌─────────────────┐     │
│    │ Utilisateur │                      │ Blockchain ETH  │     │
│    └──────┬──────┘                      └────────┬────────┘     │
│           │                                      │               │
│           ├──────────────▶ (Envoyer ETH) ───────▶│               │
│           │                    │                                 │
│           │                    ├──include──▶ (Estimer gas)      │
│           │                    └──include──▶ (Signer TX)        │
│           │                                                      │
│           ├──────────────▶ (Scanner adresse QR)                 │
│           │                                                      │
│           ├──────────────▶ (Consulter historique) ◀─────────────│
│           │                                                      │
│           └──────────────▶ (Voir détails transaction)           │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 2.3.5 Module Marché

```
┌─────────────────────────────────────────────────────────────────┐
│                        Module Marché                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│    ┌─────────────┐                      ┌─────────────────┐     │
│    │ Utilisateur │                      │   API Marché    │     │
│    └──────┬──────┘                      │ (CoinGecko)     │     │
│           │                              └────────┬────────┘     │
│           │                                      │               │
│           ├──────────────▶ (Voir liste tokens) ◀─┘               │
│           │                                                      │
│           ├──────────────▶ (Voir détail token)                  │
│           │                    │                                 │
│           │                    └──include──▶ (Afficher graphe)  │
│           │                                                      │
│           ├──────────────▶ (Rechercher token)                   │
│           │                                                      │
│           └──────────────▶ (Ajouter à watchlist)                │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 2.3.6 Module Alertes de Prix

```
┌─────────────────────────────────────────────────────────────────┐
│                     Module Alertes de Prix                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│    ┌─────────────┐                                              │
│    │ Utilisateur │                                              │
│    └──────┬──────┘                                              │
│           │                                                      │
│           ├──────────────▶ (Créer une alerte)                   │
│           │                    │                                 │
│           │                    ├── Sélectionner token           │
│           │                    ├── Définir prix cible           │
│           │                    └── Choisir condition (>/≤)       │
│           │                                                      │
│           ├──────────────▶ (Voir mes alertes)                   │
│           │                                                      │
│           ├──────────────▶ (Modifier une alerte)                │
│           │                                                      │
│           └──────────────▶ (Supprimer une alerte)               │
│                                                                  │
│    ┌─────────────┐                                              │
│    │  Système    │──────────▶ (Vérifier prix et notifier)       │
│    └─────────────┘                                              │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

## 2.4 Diagrammes de séquence

### 2.4.1 Diagramme de séquence : Création de portefeuille

```
┌──────────┐      ┌───────────┐      ┌───────────┐      ┌──────────────┐
│Utilisateur│      │   UI      │      │ WalletBloc│      │ WalletRepo   │
└─────┬─────┘      └─────┬─────┘      └─────┬─────┘      └──────┬───────┘
      │                   │                  │                   │
      │ Clic "Créer"      │                  │                   │
      │──────────────────▶│                  │                   │
      │                   │                  │                   │
      │                   │ CreateWalletEvent│                   │
      │                   │─────────────────▶│                   │
      │                   │                  │                   │
      │                   │                  │ generateWallet()  │
      │                   │                  │──────────────────▶│
      │                   │                  │                   │
      │                   │                  │        ┌──────────┴──────────┐
      │                   │                  │        │ 1. Générer mnemonic │
      │                   │                  │        │ 2. Dériver clé      │
      │                   │                  │        │ 3. Obtenir adresse  │
      │                   │                  │        │ 4. Stocker sécurisé │
      │                   │                  │        └──────────┬──────────┘
      │                   │                  │                   │
      │                   │                  │ Either<Failure,   │
      │                   │                  │        Wallet>    │
      │                   │                  │◀──────────────────│
      │                   │                  │                   │
      │                   │ WalletCreated    │                   │
      │                   │      State       │                   │
      │                   │◀─────────────────│                   │
      │                   │                  │                   │
      │ Afficher phrase   │                  │                   │
      │     mnémonique    │                  │                   │
      │◀──────────────────│                  │                   │
      │                   │                  │                   │
```

### 2.4.2 Diagramme de séquence : Envoi de transaction

```
┌──────────┐    ┌────────┐    ┌──────────┐    ┌──────────┐    ┌───────────┐
│Utilisateur│    │  UI    │    │ TxBloc   │    │ TxRepo   │    │Web3Service│
└─────┬─────┘    └───┬────┘    └────┬─────┘    └────┬─────┘    └─────┬─────┘
      │              │              │               │                │
      │ Saisir dest. │              │               │                │
      │ + montant    │              │               │                │
      │─────────────▶│              │               │                │
      │              │              │               │                │
      │ Clic "Envoyer"              │               │                │
      │─────────────▶│              │               │                │
      │              │              │               │                │
      │              │ SendTxEvent  │               │                │
      │              │─────────────▶│               │                │
      │              │              │               │                │
      │              │              │ sendTx()      │                │
      │              │              │──────────────▶│                │
      │              │              │               │                │
      │              │              │               │ estimateGas()  │
      │              │              │               │───────────────▶│
      │              │              │               │                │
      │              │              │               │   gas estimate │
      │              │              │               │◀───────────────│
      │              │              │               │                │
      │              │              │               │ sendTransaction│
      │              │              │               │───────────────▶│
      │              │              │               │                │
      │              │              │               │   tx hash      │
      │              │              │               │◀───────────────│
      │              │              │               │                │
      │              │              │ Either<F,Hash>│                │
      │              │              │◀──────────────│                │
      │              │              │               │                │
      │              │ TxSentState  │               │                │
      │              │◀─────────────│               │                │
      │              │              │               │                │
      │ Confirmation │              │               │                │
      │◀─────────────│              │               │                │
```

### 2.4.3 Diagramme de séquence : Authentification

```
┌──────────┐    ┌────────┐    ┌──────────┐    ┌──────────┐    ┌───────────┐
│Utilisateur│    │LoginPage│   │ AuthBloc │    │ AuthRepo │    │ Backend   │
└─────┬─────┘    └───┬────┘    └────┬─────┘    └────┬─────┘    └─────┬─────┘
      │              │              │               │                │
      │ Email + pwd  │              │               │                │
      │─────────────▶│              │               │                │
      │              │              │               │                │
      │ Clic "Login" │              │               │                │
      │─────────────▶│              │               │                │
      │              │              │               │                │
      │              │ LoginEvent   │               │                │
      │              │─────────────▶│               │                │
      │              │              │               │                │
      │              │ Emit Loading │               │                │
      │              │◀─────────────│               │                │
      │              │              │               │                │
      │              │              │ login()       │                │
      │              │              │──────────────▶│                │
      │              │              │               │                │
      │              │              │               │ POST /api/auth │
      │              │              │               │───────────────▶│
      │              │              │               │                │
      │              │              │               │     ┌──────────┴─────┐
      │              │              │               │     │Vérifier email  │
      │              │              │               │     │Comparer hash   │
      │              │              │               │     │Générer JWT     │
      │              │              │               │     └──────────┬─────┘
      │              │              │               │                │
      │              │              │               │ {token, user}  │
      │              │              │               │◀───────────────│
      │              │              │               │                │
      │              │              │ Either<F,User>│                │
      │              │              │◀──────────────│               │
      │              │              │               │                │
      │              │Authenticated │               │                │
      │              │    State     │               │                │
      │              │◀─────────────│               │                │
      │              │              │               │                │
      │ Navigate Home│              │               │                │
      │◀─────────────│              │               │                │
```

### 2.4.4 Diagramme de séquence : Création d'alerte de prix

```
┌──────────┐    ┌────────┐    ┌──────────┐    ┌──────────┐    ┌───────────┐
│Utilisateur│    │AlertPage│   │AlertBloc │    │AlertRepo │    │ Backend   │
└─────┬─────┘    └───┬────┘    └────┬─────┘    └────┬─────┘    └─────┬─────┘
      │              │              │               │                │
      │ Ouvrir modal │              │               │                │
      │─────────────▶│              │               │                │
      │              │              │               │                │
      │ Sélectionner │              │               │                │
      │ BTC, >50000  │              │               │                │
      │─────────────▶│              │               │                │
      │              │              │               │                │
      │ Clic "Créer" │              │               │                │
      │─────────────▶│              │               │                │
      │              │              │               │                │
      │              │CreateAlert   │               │                │
      │              │   Event      │               │                │
      │              │─────────────▶│               │                │
      │              │              │               │                │
      │              │              │ createAlert() │                │
      │              │              │──────────────▶│                │
      │              │              │               │                │
      │              │              │               │POST /api/alerts│
      │              │              │               │───────────────▶│
      │              │              │               │                │
      │              │              │               │    {alert}     │
      │              │              │               │◀───────────────│
      │              │              │               │                │
      │              │              │Either<F,Alert>│                │
      │              │              │◀──────────────│                │
      │              │              │               │                │
      │              │AlertCreated  │               │                │
      │              │    State     │               │                │
      │              │◀─────────────│               │                │
      │              │              │               │                │
      │ Confirmation │              │               │                │
      │◀─────────────│              │               │                │
```

## 2.5 Diagramme de classes

### 2.5.1 Entités du domaine (Flutter)

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         DOMAIN ENTITIES                                  │
└─────────────────────────────────────────────────────────────────────────┘

┌─────────────────────┐         ┌─────────────────────┐
│    UserEntity       │         │    WalletEntity     │
├─────────────────────┤         ├─────────────────────┤
│ - id: String        │         │ - address: String   │
│ - email: String     │         │ - mnemonic: String  │
├─────────────────────┤         │ - isImported: bool  │
│ + UserEntity()      │         │ - createdAt: Date   │
└─────────────────────┘         ├─────────────────────┤
                                │ + maskedMnemonic    │
                                │ + words: List       │
                                │ + shortAddress      │
                                └─────────────────────┘

┌─────────────────────┐         ┌─────────────────────┐
│   TokenEntity       │         │   AlertEntity       │
├─────────────────────┤         ├─────────────────────┤
│ - id: String        │         │ - id: String        │
│ - symbol: String    │         │ - tokenId: String   │
│ - name: String      │         │ - targetPrice: num  │
│ - currentPrice: num │         │ - condition: Enum   │
│ - priceChange24h    │         │ - isActive: bool    │
│ - marketCap: num    │         │ - triggeredAt: Date │
│ - volume24h: num    │         ├─────────────────────┤
│ - sparklineData     │         │ + isTriggered()     │
├─────────────────────┤         └─────────────────────┘
│ + formattedPrice    │
│ + priceChangeColor  │
└─────────────────────┘

┌─────────────────────┐         ┌─────────────────────┐
│ TransactionEntity   │         │   PortfolioEntity   │
├─────────────────────┤         ├─────────────────────┤
│ - hash: String      │         │ - totalValue: num   │
│ - from: String      │         │ - change24h: num    │
│ - to: String        │         │ - holdings: List    │
│ - value: BigInt     │         │ - snapshots: List   │
│ - gasUsed: BigInt   │         ├─────────────────────┤
│ - timestamp: Date   │         │ + changePercent     │
│ - status: Enum      │         │ + topHolding        │
├─────────────────────┤         └─────────────────────┘
│ + formattedValue    │
│ + statusColor       │
└─────────────────────┘
```

### 2.5.2 Modèles Backend (Node.js/TypeScript)

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         BACKEND MODELS                                   │
└─────────────────────────────────────────────────────────────────────────┘

┌─────────────────────┐    1    ┌─────────────────────┐
│       User          │◄────────│      Wallet         │
├─────────────────────┤    *    ├─────────────────────┤
│ - id: UUID          │         │ - id: UUID          │
│ - email: String     │         │ - userId: UUID (FK) │
│ - passwordHash      │         │ - address: String   │
│ - emailVerified     │         │ - network: String   │
│ - createdAt: Date   │         │ - nickname: String  │
│ - updatedAt: Date   │         │ - createdAt: Date   │
└─────────────────────┘         └─────────────────────┘
         │                               │
         │ 1                             │ 1
         ▼ *                             ▼ *
┌─────────────────────┐         ┌─────────────────────┐
│     Session         │         │    Transaction      │
├─────────────────────┤         ├─────────────────────┤
│ - id: UUID          │         │ - id: UUID          │
│ - userId: UUID      │         │ - walletId: UUID    │
│ - token: String     │         │ - txHash: String    │
│ - expiresAt: Date   │         │ - type: Enum        │
│ - ipAddress: String │         │ - amount: Decimal   │
└─────────────────────┘         │ - status: Enum      │
                                └─────────────────────┘

┌─────────────────────┐         ┌─────────────────────┐
│    PriceAlert       │         │   Notification      │
├─────────────────────┤         ├─────────────────────┤
│ - id: UUID          │         │ - id: UUID          │
│ - userId: UUID      │         │ - userId: UUID      │
│ - tokenId: String   │         │ - title: String     │
│ - targetPrice: Dec  │         │ - message: String   │
│ - condition: Enum   │         │ - type: Enum        │
│ - isActive: bool    │         │ - isRead: bool      │
│ - triggeredAt: Date │         │ - createdAt: Date   │
└─────────────────────┘         └─────────────────────┘

┌─────────────────────┐         ┌─────────────────────┐
│ PortfolioSnapshot   │         │     AuditLog        │
├─────────────────────┤         ├─────────────────────┤
│ - id: UUID          │         │ - id: UUID          │
│ - userId: UUID      │         │ - userId: UUID      │
│ - totalValue: Dec   │         │ - action: String    │
│ - holdings: JSON    │         │ - details: JSON     │
│ - timestamp: Date   │         │ - ipAddress: String │
└─────────────────────┘         │ - createdAt: Date   │
                                └─────────────────────┘
```

## 2.6 Architecture de l'application

### 2.6.1 Clean Architecture

Le projet suit les principes de **Clean Architecture** proposés par Robert C. Martin (Uncle Bob), garantissant une séparation claire des responsabilités et une testabilité optimale.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                                                                         │
│    ┌─────────────────────────────────────────────────────────────┐     │
│    │                     PRESENTATION                             │     │
│    │    ┌─────────────────────────────────────────────────────┐  │     │
│    │    │                      DOMAIN                          │  │     │
│    │    │    ┌─────────────────────────────────────────────┐  │  │     │
│    │    │    │                   DATA                       │  │  │     │
│    │    │    │                                              │  │  │     │
│    │    │    │  - Repositories Impl                         │  │  │     │
│    │    │    │  - Data Sources                              │  │  │     │
│    │    │    │  - Models                                    │  │  │     │
│    │    │    │                                              │  │  │     │
│    │    │    └──────────────────────────────────────────────┘  │  │     │
│    │    │                                                      │  │     │
│    │    │  - Entities                                          │  │     │
│    │    │  - Repository Interfaces                             │  │     │
│    │    │  - Failures                                          │  │     │
│    │    │                                                      │  │     │
│    │    └──────────────────────────────────────────────────────┘  │     │
│    │                                                              │     │
│    │  - Pages (Widgets)                                           │     │
│    │  - BLoCs (State Management)                                  │     │
│    │  - Widgets                                                   │     │
│    │                                                              │     │
│    └──────────────────────────────────────────────────────────────┘     │
│                                                                         │
│                           EXTERNAL SERVICES                             │
│    - Blockchain (Ethereum RPC)                                          │
│    - Market APIs (CoinGecko, Binance)                                   │
│    - Backend API                                                        │
│    - Secure Storage                                                     │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### 2.6.2 Structure des features

Chaque fonctionnalité suit une structure cohérente :

```
feature/
├── data/
│   ├── datasources/          # Sources de données (API, DB)
│   ├── models/               # Modèles de données JSON
│   └── repositories/         # Implémentation des repos
├── domain/
│   ├── entities/             # Entités métier (Freezed)
│   ├── failures/             # Types d'erreurs
│   └── repositories/         # Interfaces des repos
└── presentation/
    ├── bloc/                 # État et événements BLoC
    ├── pages/                # Écrans principaux
    └── widgets/              # Composants réutilisables
```

### 2.6.3 Architecture globale du système

```
┌─────────────────────────────────────────────────────────────────────────┐
│                          ARCHITECTURE GLOBALE                            │
└─────────────────────────────────────────────────────────────────────────┘

     ┌──────────────────────────────────────────────────────────────┐
     │                    CLIENTS                                    │
     │  ┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐      │
     │  │   iOS   │   │ Android │   │   Web   │   │ Desktop │      │
     │  │   App   │   │   App   │   │   App   │   │   App   │      │
     │  └────┬────┘   └────┬────┘   └────┬────┘   └────┬────┘      │
     │       │             │             │             │            │
     │       └─────────────┴──────┬──────┴─────────────┘            │
     │                            │                                  │
     │                    ┌───────┴───────┐                         │
     │                    │   Flutter     │                         │
     │                    │   Codebase    │                         │
     │                    └───────┬───────┘                         │
     └────────────────────────────┼─────────────────────────────────┘
                                  │
          ┌───────────────────────┼───────────────────────┐
          │                       │                       │
          ▼                       ▼                       ▼
   ┌─────────────┐        ┌─────────────┐        ┌─────────────┐
   │  Backend    │        │  Ethereum   │        │   Market    │
   │  API        │        │  Mainnet    │        │   APIs      │
   │  (Node.js)  │        │  (RPC)      │        │ (CoinGecko) │
   └──────┬──────┘        └─────────────┘        └─────────────┘
          │
   ┌──────┴──────┐
   │             │
   ▼             ▼
┌─────────┐ ┌─────────┐
│PostgreSQL│ │  Redis  │
│   DB    │ │  Cache  │
└─────────┘ └─────────┘

   ┌─────────────────────────────────────┐
   │           ADMIN DASHBOARD           │
   │         (Angular 20.x)              │
   └─────────────────────────────────────┘
```

## 2.7 Conclusion

Ce chapitre a présenté l'analyse et la conception complète du système Aether Wallet à travers différents diagrammes UML. L'architecture Clean Architecture adoptée garantit une séparation claire des responsabilités, facilitant la maintenance et l'évolution du système. Le chapitre suivant détaillera les technologies et outils utilisés pour la réalisation du projet.

---

# Chapitre 3 : Technologies et outils de développement

## 3.1 Introduction

Ce chapitre présente l'ensemble des technologies, frameworks et outils utilisés pour le développement de l'application Aether Wallet. Le choix de ces technologies a été guidé par des critères de performance, maintenabilité, et modernité.

## 3.2 Technologies Frontend Mobile

### 3.2.1 Flutter

![Flutter Logo](https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png)

**Flutter** est un framework UI open-source développé par Google, permettant de créer des applications nativement compilées pour mobile, web et desktop à partir d'une base de code unique.

| Caractéristique | Détail |
|-----------------|--------|
| **Version** | 3.x |
| **Langage** | Dart |
| **Rendu** | Skia (propre moteur graphique) |
| **Hot Reload** | Oui |
| **Performance** | Native (AOT compilation) |

**Avantages pour le projet :**
- Développement multi-plateforme (iOS, Android, Web, Desktop)
- Performances natives grâce à la compilation AOT
- Hot Reload pour un développement rapide
- Riche écosystème de packages

### 3.2.2 Dart

**Dart** est le langage de programmation utilisé par Flutter. C'est un langage orienté objet, fortement typé, optimisé pour la création d'interfaces utilisateur.

```dart
// Exemple de code Dart avec null safety
class WalletEntity {
  final String address;
  final String mnemonic;
  final bool isImported;
  final DateTime? createdAt;
  
  const WalletEntity({
    required this.address,
    required this.mnemonic,
    this.isImported = false,
    this.createdAt,
  });
  
  String get shortAddress => 
    '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
}
```

### 3.2.3 BLoC Pattern (Business Logic Component)

**BLoC** est un pattern de gestion d'état recommandé pour Flutter, séparant la logique métier de l'interface utilisateur.

```
┌─────────────────────────────────────────────────────────────────┐
│                       BLoC PATTERN                               │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌─────────┐      Events      ┌─────────┐      States          │
│   │   UI    │ ───────────────▶ │  BLoC   │ ───────────────▶     │
│   │ Widget  │                  │         │                       │
│   │         │ ◀─────────────── │         │ ◀───────────────     │
│   └─────────┘      States      └─────────┘      Repository       │
│                                                                  │
│   Input: Events (user actions, system events)                   │
│   Output: States (UI updates)                                    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

**Packages utilisés :**
- `flutter_bloc: ^9.1.0`
- `bloc: ^9.0.0`

### 3.2.4 Freezed

**Freezed** est un générateur de code pour Dart permettant de créer des classes de données immuables avec :
- Union types / Sealed classes
- Pattern matching
- copyWith automatique
- Sérialisation JSON

```dart
@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(UserEntity user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error(String message) = _Error;
}
```

### 3.2.5 Go Router

**Go Router** est la solution de navigation déclarative officielle de Flutter, offrant :
- Navigation basée sur les URLs
- Deep linking
- Guards et redirections
- Transitions personnalisées

```dart
GoRoute(
  path: '/wallet/:id',
  name: 'walletDetail',
  pageBuilder: (context, state) {
    final walletId = state.pathParameters['id']!;
    return CustomTransitionPage(
      child: WalletDetailPage(walletId: walletId),
      transitionsBuilder: _slideTransition,
    );
  },
),
```

### 3.2.6 Get It & Injectable

**Get It** est un Service Locator simple et rapide pour l'injection de dépendances. **Injectable** génère le code de configuration automatiquement.

```dart
@lazySingleton
class Web3Service {
  late Web3Client _client;
  
  Web3Service() {
    _client = Web3Client(_rpcUrl, http.Client());
  }
  
  Future<Either<Failure, EtherAmount>> getBalance(
    EthereumAddress address
  ) async {
    // ...
  }
}
```

### 3.2.7 Fpdart

**Fpdart** apporte la programmation fonctionnelle à Dart, avec des types comme `Either`, `Option`, `Task` pour une gestion élégante des erreurs.

```dart
Future<Either<CoreFailure, WalletEntity>> createWallet() async {
  try {
    final mnemonic = bip39.generateMnemonic();
    final wallet = await _generateFromMnemonic(mnemonic);
    return right(wallet);  // Success
  } catch (e) {
    return left(CoreFailure.unexpected(message: e.toString()));  // Failure
  }
}
```

### 3.2.8 Autres packages Flutter

| Package | Version | Usage |
|---------|---------|-------|
| `hive_flutter` | ^1.1.0 | Base de données locale NoSQL |
| `flutter_secure_storage` | ^9.2.4 | Stockage sécurisé des clés |
| `local_auth` | ^2.3.0 | Authentification biométrique |
| `mobile_scanner` | ^7.1.3 | Scanner QR code |
| `fl_chart` | ^0.70.2 | Graphiques interactifs |
| `dio` | ^5.8.0 | Client HTTP |
| `flutter_animate` | ^4.5.2 | Animations fluides |
| `google_fonts` | ^6.2.1 | Typographie custom |
| `lottie` | ^3.3.1 | Animations Lottie |

## 3.3 Technologies Backend

### 3.3.1 Node.js

![Node.js Logo](https://nodejs.org/static/images/logo.svg)

**Node.js** est un environnement d'exécution JavaScript côté serveur, construit sur le moteur V8 de Chrome.

| Caractéristique | Détail |
|-----------------|--------|
| **Version** | 20.x LTS |
| **Runtime** | V8 Engine |
| **I/O** | Non-bloquant, événementiel |
| **Package Manager** | npm / yarn |

### 3.3.2 Express.js

**Express.js** est un framework web minimaliste et flexible pour Node.js, fournissant un ensemble robuste de fonctionnalités pour les applications web et mobiles.

```typescript
const app = express();

// Middleware
app.use(helmet());
app.use(compression());
app.use(cors({ origin: config.corsOrigin }));
app.use(express.json());

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/wallets', walletRoutes);
app.use('/api/transactions', transactionRoutes);
app.use('/api/alerts', alertRoutes);
```

### 3.3.3 TypeScript

**TypeScript** est un sur-ensemble typé de JavaScript qui se compile en JavaScript pur.

```typescript
interface WalletAttributes {
  id: string;
  userId: string;
  address: string;
  network: string;
  nickname?: string;
  createdAt?: Date;
  updatedAt?: Date;
}

export class Wallet extends Model<WalletAttributes> 
  implements WalletAttributes {
  public id!: string;
  public userId!: string;
  public address!: string;
  public network!: string;
  // ...
}
```

### 3.3.4 PostgreSQL

![PostgreSQL Logo](https://www.postgresql.org/media/img/about/press/elephant.png)

**PostgreSQL** est un système de gestion de base de données relationnelle open-source puissant.

| Caractéristique | Détail |
|-----------------|--------|
| **Type** | RDBMS |
| **ACID** | Oui |
| **JSON Support** | Oui (JSONB) |
| **Extensions** | UUID, Full-text search |

**Tables principales :**
- `users` - Comptes utilisateurs
- `wallets` - Portefeuilles liés aux utilisateurs
- `transactions` - Historique des transactions
- `price_alerts` - Alertes de prix
- `notifications` - Notifications utilisateur
- `sessions` - Sessions actives
- `audit_logs` - Journalisation des actions

### 3.3.5 Sequelize ORM

**Sequelize** est un ORM Node.js basé sur les Promises, supportant PostgreSQL, MySQL, SQLite et plus.

```typescript
User.init(
  {
    id: {
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
      validate: { isEmail: true },
    },
    passwordHash: {
      type: DataTypes.STRING(255),
      allowNull: false,
    },
  },
  { sequelize, tableName: 'users', timestamps: true }
);
```

### 3.3.6 Redis

**Redis** est un magasin de structures de données en mémoire, utilisé comme base de données, cache et courtier de messages.

**Usages dans le projet :**
- Cache des prix de marché
- Sessions utilisateur
- Rate limiting
- File d'attente des tâches (Bull)

### 3.3.7 Socket.IO

**Socket.IO** permet une communication bidirectionnelle en temps réel entre clients et serveurs.

```typescript
const io = new Server(httpServer, {
  cors: {
    origin: config.corsOrigin,
    methods: ['GET', 'POST'],
    credentials: true,
  },
});

io.on('connection', (socket) => {
  socket.on('subscribe:price', (tokenId) => {
    socket.join(`price:${tokenId}`);
  });
  
  // Broadcast price updates
  socket.emit('price:update', { tokenId, price });
});
```

### 3.3.8 Autres packages Backend

| Package | Usage |
|---------|-------|
| `bcrypt` | Hachage des mots de passe |
| `jsonwebtoken` | Authentification JWT |
| `helmet` | Sécurité HTTP headers |
| `compression` | Compression gzip |
| `express-rate-limit` | Protection contre le DDoS |
| `winston` | Logging |
| `nodemailer` | Envoi d'emails |
| `bull` | File d'attente de tâches |

## 3.4 Technologies Blockchain

### 3.4.1 Ethereum

![Ethereum Logo](https://ethereum.org/static/a110735dade3f354a46fc2446cd52476/f3a29/eth-home-icon.webp)

**Ethereum** est la plateforme blockchain choisie pour ce projet, offrant :
- Smart contracts
- EVM (Ethereum Virtual Machine)
- Large écosystème DeFi
- Standards ERC (ERC-20, ERC-721)

**Configuration réseau :**
- **Network** : Ethereum Mainnet
- **Chain ID** : 1
- **RPC URL** : `https://eth.llamarpc.com`
- **Token natif** : ETH

### 3.4.2 Web3dart

**Web3dart** est une bibliothèque Dart pour interagir avec la blockchain Ethereum.

```dart
class Web3Service {
  late Web3Client _client;
  static const String _rpcUrl = 'https://eth.llamarpc.com';
  
  Web3Service() {
    _client = Web3Client(_rpcUrl, http.Client());
  }
  
  Future<Either<Failure, EtherAmount>> getBalance(
    EthereumAddress address
  ) async {
    try {
      final balance = await _client.getBalance(address);
      return right(balance);
    } catch (e) {
      return left(Failure.network(message: e.toString()));
    }
  }
  
  Future<Either<Failure, String>> sendTransaction({
    required EthPrivateKey credentials,
    required EthereumAddress to,
    required EtherAmount value,
  }) async {
    // Transaction signing and sending
  }
}
```

### 3.4.3 BIP39 & BIP44

**BIP39** (Bitcoin Improvement Proposal 39) définit le standard des phrases mnémoniques pour la génération de portefeuilles déterministes.

```dart
// Génération d'une phrase mnémonique
final mnemonic = bip39.generateMnemonic();
// "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"

// Validation
final isValid = bip39.validateMnemonic(mnemonic);

// Conversion en seed
final seed = bip39.mnemonicToSeed(mnemonic);
```

## 3.5 Outils de développement

### 3.5.1 Environnement de développement

| Outil | Usage |
|-------|-------|
| **VS Code / Cursor** | IDE principal |
| **Android Studio** | Émulateur Android, SDK |
| **Xcode** | Build iOS, Simulator |
| **Postman** | Test des APIs |
| **Docker** | Conteneurisation des services |

### 3.5.2 Gestion de version

| Outil | Usage |
|-------|-------|
| **Git** | Contrôle de version |
| **GitHub** | Hébergement du repository |

### 3.5.3 Angular (Admin Dashboard)

**Angular** est utilisé pour le tableau de bord administrateur.

| Caractéristique | Détail |
|-----------------|--------|
| **Version** | 20.x |
| **Langage** | TypeScript |
| **Charts** | Chart.js |
| **Blockchain** | ethers.js |

```typescript
// admin-dashboard/package.json
{
  "dependencies": {
    "@angular/core": "^20.3.0",
    "chart.js": "^4.5.1",
    "ethers": "^6.16.0",
    "rxjs": "~7.8.0"
  }
}
```

### 3.5.4 Tests

| Type | Outil |
|------|-------|
| **Unit Tests (Flutter)** | flutter_test, mocktail |
| **Integration Tests** | integration_test |
| **Unit Tests (Backend)** | Jest, ts-jest |

## 3.6 Conclusion

Ce chapitre a présenté l'ensemble des technologies utilisées pour le développement d'Aether Wallet. Le choix de Flutter permet un développement efficace multi-plateforme, tandis que le stack Node.js/PostgreSQL/Redis offre une base solide pour le backend. L'intégration Ethereum via web3dart permet des interactions réelles avec la blockchain. Le chapitre suivant présentera la réalisation concrète de l'application.

---

# Chapitre 4 : Réalisation de l'application

## 4.1 Introduction

Ce chapitre présente la réalisation concrète de l'application Aether Wallet. Nous détaillerons la structure du projet, les interfaces utilisateur développées, et les fonctionnalités implémentées.

## 4.2 Structure du projet

### 4.2.1 Structure globale

```
myWallet/
├── lib/                          # Code Flutter principal
│   ├── config/                   # Configuration (Router, DI)
│   ├── core/                     # Core (Theme, Widgets, Services)
│   └── features/                 # Modules fonctionnels
├── backend/                      # API Node.js/Express
│   └── src/
│       ├── config/               # Configuration DB, Redis
│       ├── controllers/          # Contrôleurs REST
│       ├── middleware/           # Middleware Express
│       ├── models/               # Modèles Sequelize
│       ├── routes/               # Routes API
│       ├── services/             # Logique métier
│       └── websocket/            # WebSocket handlers
├── web-admin/                    # Dashboard Angular
│   └── src/
│       ├── app/
│       └── assets/
├── android/                      # Configuration Android
├── ios/                          # Configuration iOS
├── macos/                        # Configuration macOS
├── web/                          # Configuration Web
└── assets/                       # Ressources (images, fonts)
```

### 4.2.2 Structure des features Flutter

```
lib/features/
├── achievements/                 # Système de gamification
├── admin/                        # Dashboard admin (WebView)
├── alerts/                       # Alertes de prix
│   ├── data/
│   │   └── repositories/
│   ├── domain/
│   │   ├── entities/
│   │   ├── failures/
│   │   ├── repositories/
│   │   └── services/
│   └── presentation/
│       ├── bloc/
│       ├── pages/
│       └── widgets/
├── auth/                         # Authentification
├── chat/                         # Assistant IA
├── market/                       # Données de marché
├── nft/                          # Galerie NFT
├── portfolio/                    # Analytics portefeuille
├── pulse/                        # Pulse Pay (NFC)
├── scan/                         # Scanner QR
├── settings/                     # Paramètres
├── shell/                        # Navigation principale
├── splash/                       # Écran de démarrage
├── swap/                         # Échange de tokens
├── transactions/                 # Historique transactions
└── wallet/                       # Gestion portefeuilles
```

### 4.2.3 Points d'entrée

**main.dart** - Point d'entrée Flutter :

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for local database
  await Hive.initFlutter();
  
  // Open Hive boxes
  await Hive.openBox('transactions');
  await Hive.openBox('portfolio_snapshots');
  await Hive.openBox('market_cache');
  
  // Set system UI
  SystemChrome.setSystemUIOverlayStyle(AetherTheme.systemOverlay);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // Initialize dependency injection
  configureDependencies();

  // Start services
  final alertCheckerService = getIt<AlertCheckerService>();
  alertCheckerService.startPeriodicChecking();

  runApp(const AetherWalletApp());
}
```

**server.ts** - Point d'entrée Backend :

```typescript
const startServer = async () => {
  try {
    await connectDatabase();
    await syncDatabase();
    await connectRedis();
    startPriceMonitoring();
    
    httpServer.listen(config.server.port, () => {
      console.log(`🚀 Server running on port ${config.server.port}`);
    });
  } catch (error) {
    console.error('❌ Failed to start server:', error);
    process.exit(1);
  }
};
```

## 4.3 Interfaces utilisateur

### 4.3.1 Design System - Deep Glassmorphism

Le design de l'application suit le concept **Deep Glassmorphism**, caractérisé par :

- **Fonds OLED optimisés** : Noir pur (#000000) pour économie de batterie
- **Effets de flou** : Backdrop blur sur les surfaces
- **Accents néon** : Couleurs vibrantes sur fond sombre
- **Dégradés subtils** : Transitions douces entre les couleurs

**Palette de couleurs :**

| Nom | Hex | Usage |
|-----|-----|-------|
| Neon Green | `#7CFF00` | Accents primaires, CTAs |
| Neon Magenta | `#FF00FF` | Accents secondaires |
| Neon Yellow | `#FFE600` | Accents tertiaires |
| Abyss | `#000000` | Fond principal |
| Charcoal | `#121212` | Fond secondaire |
| Glass White | `rgba(255,255,255,0.1)` | Surfaces glass |

**Typographie :**

| Style | Taille | Poids | Usage |
|-------|--------|-------|-------|
| Display Large | 48px | Bold | Titres principaux |
| Balance | 42px | Bold | Montants crypto |
| Headline Medium | 20px | SemiBold | Sous-titres |
| Body Medium | 14px | Regular | Texte courant |

### 4.3.2 Composants Glass réutilisables

```dart
// GlassCard - Carte avec effet glassmorphism
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
```

### 4.3.3 Écrans principaux

#### Écran Splash
- Animation du logo Aether
- Vérification de l'authentification
- Chargement des données initiales

#### Écran de connexion
- Champs email et mot de passe
- Validation en temps réel
- Option d'inscription
- Gestion des erreurs

#### Dashboard principal (Home)
- Solde total du portefeuille
- Graphique d'évolution
- Liste des tokens
- Actions rapides (Envoyer, Recevoir, Scan)
- Navigation vers les autres modules

#### Écran Marché
- Liste des cryptomonnaies triable
- Prix en temps réel via WebSocket
- Sparklines 7 jours
- Recherche et filtres
- Navigation vers le détail

#### Détail Token
- Graphique de prix interactif (1H, 24H, 7D, 30D, 1Y)
- Informations détaillées (Market cap, Volume, Supply)
- Bouton créer alerte
- Historique des variations

#### Scanner QR
- Interface holographique
- Animation de scanline
- Détection automatique du format
- Feedback haptique

#### Page Alertes
- Liste des alertes actives
- Création d'alerte (modal)
- Édition/Suppression
- Historique des alertes déclenchées

## 4.4 Fonctionnalités implémentées

### 4.4.1 Gestion des portefeuilles

✅ **Implémenté :**
- Génération de portefeuille avec BIP39
- Stockage sécurisé des clés (flutter_secure_storage)
- Affichage de l'adresse et QR code
- Import de portefeuille existant
- Consultation du solde ETH en temps réel

```dart
Future<Either<CoreFailure, WalletEntity>> generateWallet() async {
  try {
    // Generate BIP39 mnemonic
    final mnemonic = bip39.generateMnemonic();
    
    // Derive Ethereum wallet
    final walletResult = await _web3Service.generateWalletFromMnemonic(mnemonic);
    
    return walletResult.fold(
      (failure) => left(failure),
      (wallet) async {
        // Store securely
        await _secureStorage.write(key: 'mnemonic', value: mnemonic);
        await _secureStorage.write(key: 'address', value: wallet.address.hex);
        
        return right(WalletEntity(
          address: wallet.address.hex,
          mnemonic: mnemonic,
          createdAt: DateTime.now(),
        ));
      },
    );
  } catch (e) {
    return left(CoreFailure.unexpected(message: e.toString()));
  }
}
```

### 4.4.2 Intégration Blockchain

✅ **Implémenté :**
- Connexion au réseau Ethereum Mainnet
- Requêtes de solde
- Estimation du gas
- Signature et envoi de transactions
- Récupération des receipts

### 4.4.3 Données de marché

✅ **Implémenté :**
- API CoinGecko pour les données de prix
- WebSocket Binance pour les mises à jour temps réel
- Graphiques interactifs avec fl_chart
- Cache local avec Hive

### 4.4.4 Système d'alertes de prix

✅ **Implémenté :**
- Création d'alertes (token, prix cible, condition)
- Vérification périodique des prix
- Notifications locales
- Gestion des alertes (CRUD)

```dart
class AlertCheckerService {
  final IAlertRepository _alertRepository;
  final IMarketRepository _marketRepository;
  Timer? _timer;
  
  void startPeriodicChecking() {
    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => _checkAlerts(),
    );
  }
  
  Future<void> _checkAlerts() async {
    final alertsResult = await _alertRepository.getActiveAlerts();
    
    alertsResult.fold(
      (failure) => null,
      (alerts) async {
        for (final alert in alerts) {
          final priceResult = await _marketRepository.getTokenPrice(alert.tokenId);
          
          priceResult.fold(
            (failure) => null,
            (currentPrice) {
              if (_shouldTrigger(alert, currentPrice)) {
                _triggerAlert(alert);
              }
            },
          );
        }
      },
    );
  }
}
```

### 4.4.5 Scanner QR

✅ **Implémenté :**
- Scan de caméra en temps réel
- Détection des formats Ethereum (0x...) et Bitcoin
- UI holographique avec animations
- Toggle flash

### 4.4.6 Portfolio Analytics

✅ **Implémenté :**
- Calcul de la valeur totale
- Variation 24h
- Distribution des holdings
- Historique des snapshots

### 4.4.7 Authentification

✅ **Implémenté :**
- Inscription avec email/mot de passe
- Connexion avec JWT
- Authentification biométrique (FaceID/TouchID)
- Lock screen automatique
- Gestion des sessions

### 4.4.8 Chat IA

✅ **Implémenté :**
- Interface de chat
- Suggestions rapides
- Historique des conversations
- (Intégration LLM à connecter)

### 4.4.9 NFT Gallery

✅ **Implémenté :**
- Affichage de la collection
- Métadonnées des NFTs
- Grille responsive

## 4.5 Tests et validation

### 4.5.1 Types de tests

| Type | Couverture | Outils |
|------|------------|--------|
| Unit Tests | Blocs, Services, Repositories | flutter_test, mocktail |
| Widget Tests | Composants UI | flutter_test |
| Integration Tests | Flux complets | integration_test |
| API Tests | Endpoints REST | Jest |

### 4.5.2 Exemple de test BLoC

```dart
blocTest<WalletBloc, WalletState>(
  'emits [loading, created] when CreateWallet is added',
  build: () {
    when(() => mockRepository.createWallet())
      .thenAnswer((_) async => right(testWallet));
    return WalletBloc(repository: mockRepository);
  },
  act: (bloc) => bloc.add(const WalletEvent.create()),
  expect: () => [
    const WalletState.loading(),
    WalletState.created(testWallet),
  ],
);
```

### 4.5.3 Validation sur appareils

| Plateforme | Appareils testés |
|------------|------------------|
| iOS | iPhone 15 Pro (Simulator), iPhone 12 (Device) |
| Android | Pixel 7 (Emulator), Samsung Galaxy S21 |
| Web | Chrome, Safari, Firefox |
| macOS | MacBook Pro M1 |

## 4.6 Conclusion

Ce chapitre a présenté la réalisation concrète de l'application Aether Wallet, depuis la structure du projet jusqu'aux fonctionnalités implémentées. L'application offre une expérience utilisateur complète pour la gestion de crypto-monnaies, avec une interface moderne et des fonctionnalités avancées.

---

# Conclusion générale

## Bilan du projet

Le projet **Aether Wallet** a permis de concevoir et réaliser une application de portefeuille crypto-monnaie complète et moderne. Les objectifs initiaux ont été atteints :

### Réalisations techniques

✅ **Application mobile cross-platform** développée avec Flutter, déployable sur iOS, Android, Web et Desktop à partir d'une base de code unique.

✅ **Architecture Clean Architecture** avec séparation claire des responsabilités, facilitant la maintenance et les tests.

✅ **Intégration blockchain réelle** avec le réseau Ethereum Mainnet, permettant des opérations de portefeuille authentiques.

✅ **Backend robuste** en Node.js/TypeScript avec PostgreSQL, Redis, et WebSocket pour les mises à jour temps réel.

✅ **Interface utilisateur innovante** suivant le concept Deep Glassmorphism, optimisée pour les écrans OLED.

✅ **Sécurité renforcée** avec stockage chiffré des clés, authentification biométrique, et signature locale des transactions.

### Compétences acquises

Ce projet a permis d'acquérir et renforcer des compétences dans :

1. **Développement mobile cross-platform** avec Flutter et Dart
2. **Architecture logicielle** (Clean Architecture, BLoC pattern)
3. **Développement blockchain** et intégration Web3
4. **Développement backend** avec Node.js et TypeScript
5. **Bases de données** relationnelles (PostgreSQL) et NoSQL (Hive, Redis)
6. **Design UI/UX** moderne avec animations fluides
7. **Gestion de projet** avec méthodologie Agile

### Difficultés rencontrées

- **Gestion des dépendances** : Certains packages présentaient des conflits de versions
- **Cryptographie** : Implémentation correcte de BIP39/BIP44 pour la dérivation des clés
- **Performance** : Optimisation des animations sur les appareils moins puissants
- **Sécurité** : Stockage sécurisé des clés privées sur toutes les plateformes

## Perspectives d'évolution

### Court terme

- Support de blockchains supplémentaires (Bitcoin, Polygon, BSC)
- Intégration WalletConnect pour les dApps
- Amélioration du chat IA avec un LLM plus performant
- Notifications push via Firebase

### Moyen terme

- Support des NFTs multi-chaînes
- Fonctionnalité de swap décentralisé (DEX)
- Trading bot intégré
- Support multi-langue

### Long terme

- Hardware wallet support (Ledger, Trezor)
- Gouvernance décentralisée
- Staking et yield farming
- Version entreprise avec gestion multi-utilisateurs

## Mot de fin

Ce projet de fin d'études a été une opportunité exceptionnelle d'appliquer et d'étendre mes connaissances en développement logiciel. La réalisation d'une application de portefeuille crypto-monnaie touche à de nombreux domaines passionnants : développement mobile, blockchain, sécurité, et expérience utilisateur.

Le secteur des crypto-monnaies continue d'évoluer rapidement, et les applications de portefeuille jouent un rôle crucial dans l'adoption massive de cette technologie. Je suis convaincu que les compétences acquises durant ce projet seront précieuses pour ma carrière professionnelle.

---

# Bibliographie

[1] Flutter Documentation. (2024). Flutter - Build apps for any screen. https://flutter.dev/docs

[2] Dart Documentation. (2024). Dart programming language. https://dart.dev/guides

[3] Martin, R. C. (2017). Clean Architecture: A Craftsman's Guide to Software Structure and Design. Prentice Hall.

[4] BLoC Pattern. (2024). BLoC State Management Library. https://bloclibrary.dev/

[5] Ethereum Foundation. (2024). Ethereum Developer Documentation. https://ethereum.org/developers

[6] BIP39 Specification. (2013). Mnemonic code for generating deterministic keys. https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki

[7] Node.js Documentation. (2024). Node.js v20 Documentation. https://nodejs.org/docs/latest-v20.x/api/

[8] Express.js. (2024). Express - Fast, unopinionated, minimalist web framework. https://expressjs.com/

[9] PostgreSQL. (2024). PostgreSQL Documentation. https://www.postgresql.org/docs/

[10] Sequelize. (2024). Sequelize ORM Documentation. https://sequelize.org/docs/v6/

[11] Redis. (2024). Redis Documentation. https://redis.io/documentation

[12] Socket.IO. (2024). Socket.IO Documentation. https://socket.io/docs/v4/

[13] web3dart Package. (2024). Dart library to connect to Ethereum. https://pub.dev/packages/web3dart

[14] CoinGecko API. (2024). Cryptocurrency Data API. https://www.coingecko.com/en/api

[15] Angular Documentation. (2024). Angular - The modern web developer's platform. https://angular.io/docs

[16] Freezed Package. (2024). Code generation for immutable classes. https://pub.dev/packages/freezed

[17] Get It Package. (2024). Simple Service Locator for Dart and Flutter. https://pub.dev/packages/get_it

[18] Go Router Package. (2024). A declarative router for Flutter. https://pub.dev/packages/go_router

[19] Hive Database. (2024). Lightweight and blazing fast key-value database. https://pub.dev/packages/hive

[20] Flutter Secure Storage. (2024). Plugin to store data in secure storage. https://pub.dev/packages/flutter_secure_storage

---

# Annexes

## Annexe A : Configuration de l'environnement de développement

### Prérequis

- Flutter SDK ^3.9.0
- Dart SDK ^3.9.2
- Node.js ^20.x
- PostgreSQL ^15.x
- Redis ^7.x
- Xcode (pour iOS)
- Android Studio (pour Android)

### Installation

```bash
# Clone du repository
git clone https://github.com/user/myWallet.git
cd myWallet

# Installation des dépendances Flutter
flutter pub get

# Installation des dépendances Backend
cd backend && npm install

# Configuration de la base de données
./setup-database.sh

# Lancement
flutter run  # Frontend
npm run dev  # Backend
```

## Annexe B : Variables d'environnement

```env
# Backend .env
DATABASE_URL=postgresql://user:pass@localhost:5432/aether_wallet
REDIS_URL=redis://localhost:6379
JWT_SECRET=your-secret-key
COINGECKO_API_KEY=your-api-key
```

## Annexe C : API Endpoints

| Méthode | Endpoint | Description |
|---------|----------|-------------|
| POST | `/api/auth/register` | Inscription |
| POST | `/api/auth/login` | Connexion |
| GET | `/api/wallets` | Liste des portefeuilles |
| POST | `/api/wallets` | Créer un portefeuille |
| GET | `/api/transactions` | Historique |
| POST | `/api/alerts` | Créer une alerte |
| GET | `/api/portfolio` | Analytics |

---

**Document rédigé dans le cadre du Projet de Fin d'Études**

**Année universitaire 2024-2025**

