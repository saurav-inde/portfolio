const projects = [
  // Dasho
  {
    "thumbnail": "assets/projects/dasho.jpg",
    "title": "Dasho - Unified Delivery & Marketplace Platform",
    "description":
        "Lead Full Stack Developer for Logizee Solutions LLP's flagship multi-role delivery and marketplace application",
    "briefDetail":
        "As Technical Lead, architected and developed a comprehensive parcel delivery system with integrated marketplace, serving businesses, delivery partners, and customers through a single unified application. Led a cross-functional team to deliver a scalable solution handling real-time tracking, driver assignment, and multi-role workflows.",
    "liveOnPlay":
        "https://play.google.com/store/apps/details?id=com.logizee.connect_it.dasho&pcampaignid=web_share",
    "techStack": [
      "Node.js",
      "Flutter",
      "Kotlin",
      "PostgreSQL",
      "Firebase FCM",
      "Google Maps API",
      "Vector Database",
      "JWT Authentication",
      "NGINX",
      "Clean Architecture",
    ],
    "highlights": [
      {
        "title": "Architecture & Leadership",
        "image": "dasho/architecture_highlight.jpeg",
        "list": [
          "Led end-to-end development implementing Clean Architecture principles",
          "Managed cross-platform development team (Flutter & Kotlin)",
          "Designed scalable microservices architecture with Node.js backend",
          "Implemented CI/CD pipelines with NGINX reverse proxy deployment",
        ],
      },
      {
        "title": "Technical Innovation",
        "image": "dasho/technical_highlight.jpeg",
        "list": [
          "Integrated PostgreSQL with vector database for optimized spatial queries",
          "Implemented real-time parcel tracking with Google Maps Routes API",
          "Developed intelligent nearby driver assignment algorithm",
          "Built multi-role authentication system with JWT and OTP verification",
        ],
      },
    ],
    "keyFeatures": [
      {
        "title": "Unified Multi-Role Platform",
        "list": [
          "Single app serving customers, businesses, and delivery partners",
          "Role-based workflows and UI customization",
          "Seamless switching between marketplace and delivery functionalities",
          "Unified authentication system with dynamic permissions",
        ],
      },
      {
        "title": "Intelligent Delivery System",
        "list": [
          "Real-time driver assignment based on proximity and availability",
          "Live parcel tracking with ETA predictions",
          "Smart caching for offline functionality",
          "Automated route optimization using Google Maps API",
        ],
      },
      {
        "title": "Marketplace Integration",
        "list": [
          "Integrated e-commerce with delivery services",
          "Business dashboard for order management",
          "Inventory and delivery coordination",
          "Real-time order status updates",
        ],
      },
    ],
    "deliverables": [
      {
        "title": "Backend Development",
        "list": [
          "RESTful API development with Node.js",
          "JWT-based OTP authentication system",
          "PostgreSQL database design with vector integration",
          "Real-time notification system with FCM",
        ],
        "icon": "node.js.svg",
      },
      {
        "title": "Mobile Applications",
        "list": [
          "Cross-platform Flutter app for customers and businesses",
          "Native Kotlin app for delivery partners",
          "Offline caching implementation",
          "Google Maps integration with real-time tracking",
        ],
        "icon": "android-development.svg",
      },
      {
        "title": "Infrastructure & Deployment",
        "list": [
          "NGINX reverse proxy configuration",
          "Database optimization and indexing",
          "API security and rate limiting",
          "Performance monitoring and analytics",
        ],
        "icon": "nginex.svg",
      },
    ],
  },

  // Passman
  {
    "thumbnail": "assets/projects/passman.png",
    "title": "PassMan - Secure Password Manager",
    "description":
        "A Flutter-based password and encrypted notes manager with AES-256 encryption, Firebase authentication, and Firestore backups — built with Clean Architecture, BLoC, and native Kotlin Autofill integration for seamless password management.",
    "briefDetail":
        "PassMan is a secure password management application developed for Android and iOS, designed to store and organize user credentials, private notes, and autofill data safely. It combines Flutter’s cross-platform capabilities with native Kotlin integration for system-level Autofill and Autosave services. Leveraging AES-256 encryption for local data security, Firebase Authentication for identity management, and Firestore for encrypted backups, PassMan ensures both usability and uncompromising security through Clean Architecture principles.",
    "liveOnPlay":
        "https://play.google.com/store/apps/details?id=com.xceed.passman&pcampaignid=web_share",
    "techStack": [
      "Flutter",
      "Dart",
      "Kotlin",
      "Firebase Authentication",
      "Cloud Firestore",
      "AES-256 Encryption",
      "Hive Local Database",
      "BLoC State Management",
      "Firebase Cloud Messaging",
      "Secure Storage API",
      "Clean Architecture",
    ],
    "highlights": [
      {
        "title": "Security & Data Protection",
        "image": "passman/security_highlight.jpeg",
        "list": [
          "Implemented AES-256 encryption for all locally stored passwords and notes",
          "Used unique per-user encryption keys stored securely via Android Keystore / iOS Keychain",
          "Integrated Firebase Authentication for secure login with email, Google, and OTP verification",
          "Firestore backups are end-to-end encrypted before upload, ensuring zero plaintext exposure",
        ],
      },
      {
        "title": "Architecture & Engineering",
        "image": "passman/architecture_highlight.jpeg",
        "list": [
          "Followed Clean Architecture pattern with feature-based modular structure",
          "Used BLoC for predictable and testable state management across all modules",
          "Isolated data layers for local (Hive) and remote (Firestore) repositories",
          "Implemented background sync service for offline-first functionality and auto cloud backup",
          "Integrated Flutter–Kotlin bridge for native Autofill and Autosave services",
        ],
      },
    ],
    "keyFeatures": [
      {
        "title": "AES-Encrypted Vault",
        "list": [
          "All passwords and notes are encrypted with AES-256 before local or cloud storage",
          "Master key securely generated and stored in native keystore",
          "Zero-knowledge architecture — only user can decrypt their data",
          "Auto-lock and wipe after inactivity or failed attempts",
        ],
      },
      {
        "title": "Cross-Device Backup & Sync",
        "list": [
          "Encrypted cloud backups to Firestore for seamless device syncing",
          "Offline-first operation using Hive local database",
          "Automatic incremental sync on connectivity restoration",
          "Manual export/import options for offline backup",
        ],
      },
      {
        "title": "Native Autofill & Autosave Integration",
        "list": [
          "Developed in Kotlin using Android’s Autofill Framework",
          "Automatic credential suggestions for supported apps and browsers",
          "Autosave feature for detecting and storing new login credentials",
          "Bi-directional communication between Flutter UI and native Autofill service via MethodChannel",
          "Secure retrieval from AES-encrypted vault during autofill operations",
        ],
      },
      {
        "title": "Password Autofill & Notes",
        "list": [
          "Integrated Android Autofill service for direct credential suggestions",
          "Secure Notes section for sensitive data storage",
          "Quick search and category-based organization",
          "Support for custom fields like URLs, tags, and notes",
        ],
      },
      {
        "title": "User Experience & Design",
        "list": [
          "Minimal, modern Flutter UI with dark mode and smooth animations",
          "Custom typewriter animated texts and visual cues for feedback",
          "Countdown timers for verification link resends",
          "Accessibility and responsiveness optimized across devices",
        ],
      },
    ],
    "deliverables": [
      {
        "title": "Frontend (Flutter Application)",
        "list": [
          "Fully responsive Flutter app for Android and iOS",
          "BLoC-based reactive state management",
          "Offline caching with Hive and secure data handling",
          "Smooth animations and consistent theme across screens",
        ],
        "icon": "flutter.svg",
      },
      {
        "title": "Backend & Cloud Integration",
        "list": [
          "Firebase Authentication (email/password, Google, OTP)",
          "Firestore encrypted backups via AES before upload",
          "FCM notifications for sync and verification events",
          "Cloud Functions for backup validation and cleanup",
        ],
        "icon": "firebase.svg",
      },
      {
        "title": "Security & Infrastructure",
        "list": [
          "AES-256 encryption with IV and salt handling per entry",
          "Master key management via Android Keystore / iOS Keychain",
          "Automatic session lock and clipboard timeout for copied passwords",
          "Encrypted Firestore rules enforcing user-level access control",
        ],
        "icon": "security.svg",
      },
      {
        "title": "Native Kotlin Autofill & Autosave Service",
        "list": [
          "Developed Android AutofillService in Kotlin integrated via Flutter MethodChannel",
          "Autosave detection for login forms and credential updates",
          "Secure credential suggestions directly from AES-encrypted vault",
          "Optimized IPC layer ensuring minimal latency during autofill events",
          "Background validation and cache invalidation using WorkManager",
        ],
        "icon": "kotlin.svg",
      },
    ],
  },

  // Spindle
  {
    "thumbnail": "assets/projects/spindle.jpg",
    "title": "Spindle - Multiplayer Fidget Spinner Game & Reward Platform",
    "description":
        "Creator and Lead Developer of Spindle — a custom-built fidget spinner simulator and social gaming experience, developed entirely in Flutter with a Node.js backend and real-time multiplayer dashboard.",
    "briefDetail":
        "Spindle is an interactive fidget spinner experience that merges calming visuals with competitive play. Built entirely in Flutter without external game engines, it features a live multiplayer leaderboard, in-app store, AdMob integration, and a reward currency system based on spins and referrals. The backend, developed in Node.js with PostgreSQL and JWT authentication, handles user data, leaderboards, and in-game transactions. Designed for smooth performance, visual delight, and scalable multiplayer logic, Spindle combines mindfulness with engagement through a futuristic theme.",
    "liveOnPlay":
        "https://play.google.com/store/apps/details?id=com.xceed.fidx&pcampaignid=web_share",
    "techStack": [
      "Flutter",
      "Dart",
      "Node.js",
      "PostgreSQL",
      "JWT Authentication",
      "Firebase FCM",
      "AdMob Integration",
      "Play Store Referral API",
      "WebSockets (Socket.IO)",
      "Clean Architecture",
    ],
    "highlights": [
      {
        "title": "Architecture & Game Engineering",
        "image": "spindle/architecture_highlight.jpeg",
        "list": [
          "Developed complete game experience purely in Flutter — no external game engine used",
          "Implemented modular Clean Architecture for UI, logic, and backend layers",
          "Built Node.js backend with REST + WebSocket hybrid for real-time dashboard updates",
          "Integrated multi-login system with Google and email authentication using JWT",
        ],
      },
      {
        "title": "Technical Innovation & Engagement",
        "image": "spindle/technical_highlight.jpeg",
        "list": [
          "Designed live leaderboard dashboard showing top 50 global spinners",
          "Implemented reward-based currency (coins & jewels) earned from spins and referrals",
          "Developed in-app store for spinner purchases, upgrades, and materials",
          "Integrated Play Store referral system for growth and user acquisition",
          "Used AdMob interstitial and rewarded ads for in-game monetization",
        ],
      },
    ],
    "keyFeatures": [
      {
        "title": "Pure Flutter Game Engine",
        "list": [
          "Game physics and animations written manually in Flutter with zero third-party engines",
          "Dynamic rotation physics synced with audio feedback and background music",
          "Smooth, optimized frame handling for high FPS gameplay",
          "Reactive state transitions between idle, spinning, and reward modes",
        ],
      },
      {
        "title": "Reward & Currency System",
        "list": [
          "Players earn coins and jewels based on spin duration and performance",
          "Referral system grants bonus rewards for inviting friends",
          "Currency used for purchasing new spinners, effects, and themes",
          "Backend tracks all in-game economy securely via PostgreSQL transactions",
        ],
      },
      {
        "title": "Multiplayer & Live Dashboard",
        "list": [
          "Real-time leaderboard with top 50 players updated via WebSockets",
          "Dynamic stats and player activity shown in live dashboard",
          "Seamless user identity tracking across devices",
          "Optimized message broadcasting and caching for minimal server load",
        ],
      },
      {
        "title": "Store & Customization",
        "list": [
          "In-app store with unique spinner designs, materials, and rarity tiers",
          "Unlockable spinners with distinct weight, friction, and sound effects",
          "Premium items purchasable via earned or rewarded currency",
          "Dynamic inventory synced between client and backend",
        ],
      },
      {
        "title": "Authentication & User Management",
        "list": [
          "Implemented Google Sign-In and email-based login via JWT-secured APIs",
          "User session tokens with refresh logic handled on both app and server",
          "Cross-platform authentication and data sync via Node.js backend",
          "Secure password-less sign-ins with token-based identity handling",
        ],
      },
    ],
    "deliverables": [
      {
        "title": "Frontend (Flutter Game Application)",
        "list": [
          "Built entire gameplay engine and physics manually in Flutter",
          "Integrated AdMob interstitial and reward ads for monetization",
          "Developed in-app store with local caching and reactive animations",
          "Implemented responsive UI and smooth transitions for all devices",
        ],
        "icon": "flutter.svg",
      },
      {
        "title": "Backend & APIs",
        "list": [
          "Developed RESTful and WebSocket APIs using Node.js and Express",
          "JWT-based authentication and refresh token system",
          "PostgreSQL database schema for users, rewards, referrals, and transactions",
          "Leaderboard synchronization and event broadcasting with Socket.IO",
        ],
        "icon": "node.js.svg",
      },
      {
        "title": "Infrastructure & Integrations",
        "list": [
          "AdMob integration for ad-based monetization",
          "Play Store referral system for user acquisition and engagement tracking",
          "Firebase FCM for push notifications and event alerts",
          "Secure deployment with NGINX reverse proxy and rate limiting",
        ],
        "icon": "firebase.svg",
      },
    ],
  },

  // Composer
  {
    "thumbnail": "assets/projects/composer.jpg",
    "title": "Composer - Modern Notes App",
    "description":
        "Lead Android Developer for a pure Jetpack Compose notes application with advanced features",
    "briefDetail":
        "As Lead Android Developer, designed and built a modern notes application using 100% Jetpack Compose with MVVM architecture. Implemented robust data persistence, dependency injection, and smooth UI interactions while maintaining clean code architecture and best practices.",
    "techStack": [
      "Kotlin",
      "Jetpack Compose",
      "MVVM Architecture",
      "Dagger Hilt",
      "Room Database",
      "Coroutines",
      "Flow",
      "Material Design 3",
      "ViewModel",
      "Navigation Component",
    ],
    "highlights": [
      {
        "title": "Modern Android Development",
        "image": "composer/architecture_highlight.jpeg",
        "list": [
          "Built with 100% Jetpack Compose for declarative UI",
          "Implemented clean MVVM architecture with separation of concerns",
          "Utilized Dagger Hilt for dependency injection throughout the app",
          "Leveraged Room database for efficient local data persistence",
        ],
      },
      {
        "title": "Performance & User Experience",
        "image": "composer/technical_highlight.jpeg",
        "list": [
          "Optimized UI performance with Compose recomposition best practices",
          "Implemented smooth animations and transitions",
          "Used Kotlin Coroutines and Flow for asynchronous operations",
          "Designed responsive layout that adapts to different screen sizes",
        ],
      },
    ],
    "keyFeatures": [
      {
        "title": "Notes Management",
        "list": [
          "Create, edit, and delete notes with rich text formatting",
          "Organize notes with categories and tags",
          "Search functionality with real-time filtering",
          "Pin important notes for quick access",
        ],
      },
      {
        "title": "Data Persistence",
        "list": [
          "Local database using Room with complex queries",
          "Automatic background saving with conflict resolution",
          "Data migration handling for schema updates",
          "Offline-first approach with reliable sync",
        ],
      },
      {
        "title": "Modern UI/UX",
        "list": [
          "Dark and light theme support",
          "Customizable note colors and themes",
          "Intuitive gestures for note actions",
          "Accessibility support with screen readers",
        ],
      },
    ],
    "deliverables": [
      {
        "title": "Native Android App",
        "list": [
          "Pure Jetpack Compose UI implementation",
          "Proper MVVM based architecture",
          "Create and manage notes with tags",
          "Material Design 3 component integration",
        ],
        "icon": "android-development.svg",
      },
    ],
  },

  // Fino
  {
    "thumbnail": "assets/projects/fino.png",
    "title": "Now Fino - AI-Powered Personal Expense Manager",
    "description":
        "Lead Flutter Developer for an intelligent, privacy-focused expense management application featuring voice-first input and on-device AI analysis",
    "briefDetail":
        "Architected and developed a revolutionary expense tracking app that enables frictionless voice-based expense logging with automatic categorization using OpenAI/NVIDIA APIs. Built a custom natural language query pipeline for complex financial analysis while ensuring user data never leaves the device, maintaining complete privacy.",
    "techStack": [
      "Flutter",
      "Dart",
      "OpenAI API",
      "NVIDIA NIM API",
      "SQLite",
      "Speech-to-Text",
      "Riverpod",
      "Clean Architecture",
      "Custom NLP Pipeline",
      "Chart Visualization",
      "On-Device Processing",
    ],
    "highlights": [
      {
        "title": "Voice-First Architecture & AI Integration",
        "image": "nowfino/voice_ai_highlight.jpeg",
        "list": [
          "Designed voice-first expense logging with natural language processing",
          "Integrated OpenAI and NVIDIA APIs for intelligent categorization",
          "Built custom speech-to-expense pipeline with automatic field generation",
          "Implemented chat-based UI for conversational expense addition",
        ],
      },
      {
        "title": "Privacy-Preserving AI Analysis",
        "image": "nowfino/privacy_highlight.jpeg",
        "list": [
          "Developed custom NLP query parser that runs entirely on-device",
          "User financial data never transmitted to external AI services",
          "Query decomposition into actionable filtering, grouping, and sorting steps",
          "Local execution of complex analytical operations",
        ],
      },
    ],
    "keyFeatures": [
      {
        "title": "Intelligent Voice Input",
        "list": [
          "Natural language expense logging (e.g., 'I bought coffee for Rs 50 yesterday evening')",
          "Automatic category detection and field population",
          "Context-aware date and time parsing",
          "Multi-language voice command support",
        ],
      },
      {
        "title": "Chat-Based Interface",
        "list": [
          "Conversational UI for expense management",
          "Natural language query processing for analysis",
          "Interactive chat for expense modification and categorization",
          "Seamless transition between voice and text input",
        ],
      },
      {
        "title": "Advanced On-Device Analytics",
        "list": [
          "Complex query processing (e.g., 'What did I spend most on in food last month?')",
          "Custom pipeline for query decomposition and execution",
          "Real-time filtering, grouping, and aggregation",
          "Interactive charts and visualization generation",
        ],
      },
    ],
    "deliverables": [
      {
        "title": "Analysis Pipeline",
        "list": [
          "On-device query decomposition engine",
          "Natural language to database query translator",
          "Real-time filtering and aggregation system",
          "Privacy-preserving analytical processing",
        ],
        "icon": "",
      },
      {
        "title": "Flutter Application",
        "list": [
          "Cross-platform mobile app with chat-based UI",
          "Local SQLite database for complete data privacy",
          "Custom chart library for financial visualization",
          "Riverpod state management with Clean Architecture",
        ],
        "icon": "flutter.svg",
      },
    ],
  },

  // Quicknotes
  {
    "thumbnail": "assets/projects/quicknote.jpg",
    "title": "QuickNotes - Enhanced Windows Note-Taking Application",
    "description":
        "Solo Flutter Developer for a feature-rich desktop note-taking application designed to improve upon native Windows notes with advanced organization and productivity features",
    "briefDetail":
        "Developed a comprehensive Windows notes application using Flutter to address limitations of native note-taking apps. Implemented automatic saving, intuitive organization systems, and robust search capabilities while maintaining a clean, user-friendly interface. Built as a learning project that evolved into a personally-used productivity tool with SQLite local storage.",
    "techStack": [
      "Flutter",
      "Dart",
      "SQLite",
      "Windows Desktop",
      "Riverpod",
      "Material Design",
      "Local Storage",
      "Search Algorithms",
      "Color Theory",
      "UI/UX Design",
    ],
    "highlights": [
      {
        "title": "Desktop-First Architecture",
        "image": "quicknotes/architecture_highlight.jpeg",
        "list": [
          "Designed specifically for Windows desktop with optimized window management",
          "Implemented real-time auto-save functionality with conflict resolution",
          "Built comprehensive note organization system with color coding",
          "Developed efficient SQLite database schema for fast note retrieval",
        ],
      },
      {
        "title": "Enhanced User Experience",
        "image": "quicknotes/ux_highlight.jpeg",
        "list": [
          "Created grid and list views for flexible note browsing",
          "Implemented advanced search with keyword highlighting",
          "Built robust recycle bin with recovery capabilities",
          "Designed intuitive color coding system for visual organization",
        ],
      },
    ],
    "keyFeatures": [
      {
        "title": "Smart Note Management",
        "list": [
          "Instant auto-save with edit history tracking",
          "Color coding system with custom palette selection",
          "Grid and list view options for different workflow preferences",
          "Bulk operations for multiple note management",
        ],
      },
      {
        "title": "Advanced Organization",
        "list": [
          "Full-text search with real-time results",
          "Recycle bin with permanent delete and restore options",
          "Note filtering by color, date, and content",
          "Creation and modification date tracking",
        ],
      },
      {
        "title": "Productivity Enhancements",
        "list": [
          "Quick note creation with keyboard shortcuts",
          "Rich text formatting options",
          "Note pinning for priority management",
          "Export functionality for note backup",
        ],
      },
    ],
    "deliverables": [
      {
        "title": "Desktop Application",
        "list": [
          "Native Windows application built with Flutter desktop",
          "Responsive UI optimized for desktop workflows",
          "SQLite database integration for local storage",
          "Window management and multi-instance support",
        ],
        "icon": "windows.svg",
      },
    ],
  },

  // retailx
  {
    "thumbnail": "assets/projects/retailx.jpg",
    "title": "RetailX - Smart Inventory & Billing System",
    "description":
        "Full Stack Developer for a cross-platform retail management and billing solution built for small to medium businesses.",
    "briefDetail":
        "Developed RetailX, a modern inventory and billing application enabling businesses to manage stock, generate invoices, and handle sales through barcode scanning and camera integration. The system supported multi-device logins, real-time synchronization, and role-based access across users and staff. Designed to streamline daily retail operations with seamless offline-first experience and secure backend connectivity.",
    "techStack": [
      "Flutter",
      "Node.js",
      "PostgreSQL",
      "Firebase Authentication",
      "Camera & Barcode Scanning",
      "Clean Architecture",
      "RESTful APIs",
    ],
    "highlights": [
      {
        "title": "Inventory Management System",
        "image": "retailx/inventory_highlight.jpeg",
        "list": [
          "Built a responsive Flutter app with barcode and camera scanning for billing automation",
          "Implemented stock management with auto-reorder and category-based tracking",
          "Real-time sync between multiple devices through Node.js REST API",
          "Offline caching and queued sync for unstable connections",
        ],
      },
      {
        "title": "System Design & Scalability",
        "image": "retailx/system_design_highlight.jpeg",
        "list": [
          "Designed normalized PostgreSQL schema for high-volume product data",
          "Implemented JWT-secured multi-user sessions with Firebase Auth integration",
          "Optimized Node.js backend for concurrent device access and minimal latency",
          "Used Clean Architecture to separate domain logic and presentation layers",
        ],
      },
    ],
    "keyFeatures": [
      {
        "title": "Smart Billing & POS Integration",
        "list": [
          "Instant billing via barcode or camera scanning",
          "Dynamic tax and discount computation",
          "Multi-payment mode support (cash, UPI, card)",
          "Auto-generated printable and sharable invoices",
        ],
      },
      {
        "title": "Inventory Control & Analytics",
        "list": [
          "Category-wise stock insights and sales tracking",
          "Low-stock alerts and reorder recommendations",
          "Purchase and sales history with graphical summaries",
          "Exportable reports for accounting systems",
        ],
      },
      {
        "title": "Multi-Device & Secure Access",
        "list": [
          "Simultaneous login from multiple devices with real-time sync",
          "Role-based permission system for staff and owners",
          "JWT-secured REST API communication",
          "End-to-end data encryption with Firebase Authentication",
        ],
      },
    ],
    "deliverables": [
      {
        "title": "Backend Development",
        "list": [
          "Node.js-based RESTful APIs for inventory, billing, and user modules",
          "JWT-based secure authentication with role management",
          "PostgreSQL database design and query optimization",
          "Real-time stock update synchronization across users",
        ],
        "icon": "node.js.svg",
      },
      {
        "title": "Mobile Application",
        "list": [
          "Flutter cross-platform app for Android and iOS",
          "Integrated camera-based barcode scanner",
          "Offline-first inventory operations",
          "Custom billing UI with real-time cart and receipt generation",
        ],
        "icon": "flutter.svg",
      },
      {
        "title": "Infrastructure & Deployment",
        "list": [
          "Deployed on Node.js server with NGINX reverse proxy",
          "PostgreSQL optimization and backup configuration",
          "Firebase Auth for secure access control",
          "Performance analytics and error tracking setup",
        ],
        "icon": "nginex.svg",
      },
    ],
  },
  // Home automation
  {
    "thumbnail": "assets/projects/iot.jpg",
    "title": "SmartSwitch Pro - IoT Home Automation System",
    "description":
        "Full-Stack IoT Solution Architect for an intelligent home automation platform combining hardware, firmware, and mobile applications",
    "briefDetail":
        "Designed and developed a comprehensive home automation ecosystem from ground up, creating custom 3D-printed smart switches with ESP32 microcontrollers, building a robust Flutter control application, and implementing a secure local network communication protocol. Expanded the system to support multiple devices, automation scenarios, and energy monitoring capabilities.",
    "techStack": [
      "Flutter",
      "Dart",
      "ESP32",
      "Arduino C++",
      "WebSocket",
      "REST API",
      "3D Printing & Design",
      "Local Network Communication",
      "PCB Design",
      "Servo Motor Control",
      "WiFi Networking",
    ],
    "highlights": [
      {
        "title": "Hardware & Embedded Systems",
        "image": "smartswitch/hardware_highlight.jpeg",
        "list": [
          "Designed and 3D-printed custom smart switch mechanisms with servo integration",
          "Programmed ESP32 microcontrollers with Arduino C++ for reliable operation",
          "Implemented local WiFi connectivity with secure device authentication",
          "Developed PCB designs for compact and efficient circuit layouts",
          "Created energy monitoring sensors with real-time power consumption tracking",
        ],
      },
      {
        "title": "Software Architecture & Mobile Development",
        "image": "smartswitch/software_highlight.jpeg",
        "list": [
          "Built cross-platform Flutter app with real-time device control dashboard",
          "Implemented WebSocket and REST APIs for instantaneous communication",
          "Designed local network discovery system for automatic device detection",
          "Created automation engine for scheduling and trigger-based actions",
          "Developed remote access capabilities with secure tunnel implementation",
        ],
      },
    ],
    "keyFeatures": [
      {
        "title": "Smart Device Ecosystem",
        "list": [
          "Custom 3D-printed smart switches with servo motor mechanisms",
          "Multi-device support with centralized control system",
          "Local network operation with optional cloud synchronization",
          "Energy monitoring and consumption analytics",
          "Physical button integration with smart override capabilities",
        ],
      },
      {
        "title": "Intelligent Automation",
        "list": [
          "Time-based scheduling for daily routines",
          "Motion and sensor-based trigger automation",
          "Scene creation for multi-device coordination",
          "Voice control integration with popular assistants",
          "Geofencing for location-based automation",
        ],
      },
      {
        "title": "Advanced Control System",
        "list": [
          "Real-time status monitoring and control",
          "Group device management for room-based control",
          "Energy usage reports and cost analysis",
          "Usage patterns and optimization suggestions",
          "Backup and restore configuration capabilities",
        ],
      },
    ],
    "deliverables": [
      {
        "title": "Hardware & Firmware",
        "list": [
          "Custom 3D-printed smart switch assemblies",
          "ESP32 microcontroller programming in Arduino C++",
          "WiFi connectivity with secure local network communication",
          "Servo motor control algorithms for smooth operation",
          "Power monitoring circuit design and implementation",
        ],
        "icon": "iot.svg",
      },
      {
        "title": "Mobile Application",
        "list": [
          "Flutter cross-platform control application",
          "Real-time dashboard with device status monitoring",
          "Automation rule builder and scheduler",
          "Local network device discovery and pairing",
          "Energy analytics and reporting interface",
        ],
        "icon": "flutter.svg",
      },
    ],
  },

  //
];
