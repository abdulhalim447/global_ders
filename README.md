# Educational App - Feature-First Architecture

A Flutter educational app built with clean architecture principles, featuring a modular, scalable, and maintainable codebase.

## 🏗️ Architecture

This project follows **Feature-First Architecture** with clean architecture principles:

```
lib/
├── core/                          # Shared core functionality
│   ├── constants/                 # App-wide constants
│   │   └── app_constants.dart     # Dimensions, strings, config values
│   ├── theme/                     # Theme configuration
│   │   ├── app_colors.dart        # Color palette (dark/light)
│   │   ├── app_theme.dart         # Material theme setup
│   │   └── app_text_styles.dart   # Typography with Google Fonts
│   ├── utils/                     # Utility functions
│   └── widgets/                   # Reusable widgets
│       ├── custom_bottom_navigation.dart
│       ├── custom_search_bar.dart
│       └── custom_chip.dart
│
├── features/                      # Feature modules
│   ├── home/                      # Home feature
│   │   ├── data/                  # Data layer
│   │   │   ├── models/            # Data models
│   │   │   ├── repositories/      # Repository implementations
│   │   │   └── datasources/       # Remote/local data sources
│   │   ├── domain/                # Domain layer
│   │   │   ├── entities/          # Business entities
│   │   │   ├── repositories/      # Repository interfaces
│   │   │   └── usecases/          # Business logic
│   │   └── presentation/          # Presentation layer
│   │       ├── pages/             # Screen widgets
│   │       │   └── home_screen.dart
│   │       ├── widgets/           # Feature-specific widgets
│   │       │   ├── video_course_card.dart
│   │       │   ├── course_list_item.dart
│   │       │   └── recommended_item.dart
│   │       └── providers/         # Riverpod providers
│   │
│   └── profile/                   # Profile feature
│       ├── data/
│       │   ├── models/
│       │   ├── repositories/
│       │   └── datasources/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── pages/
│           │   └── profile_screen.dart
│           ├── widgets/
│           │   ├── profile_header.dart
│           │   └── settings_list_item.dart
│           └── providers/
│
└── main.dart                      # App entry point
```

## 🎨 Design System

### Colors
- **Primary Accent**: Lime Green (#B4FF39)
- **Dark Theme**: Dark backgrounds with high contrast
- **Light Theme**: Clean, minimal light backgrounds

### Typography
- **Font Family**: Poppins (Google Fonts)
- **Weights**: 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold)

### Components
- Custom bottom navigation with center floating button
- Reusable search bar with filter icon
- Filter chips for content categorization
- Video course cards with play overlay
- Settings list items with icons

## 🛠️ Tech Stack

- **Framework**: Flutter 3.10+
- **State Management**: Riverpod 2.6+
- **Fonts**: Google Fonts (Poppins)
- **Architecture**: Feature-First + Clean Architecture

## 📦 Dependencies

```yaml
dependencies:
  flutter_riverpod: ^2.6.1    # State management
  google_fonts: ^6.2.1        # Typography
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.10.1 or higher
- Dart SDK 3.10.1 or higher

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd global_ders
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## 📱 Features

### Home Screen
- Search functionality
- Video course section with play button
- Filter chips (All Levels, Beginner, Intermediate)
- Course list with navigation
- Recommended content section
- Bottom navigation

### Profile Screen
- User profile header with avatar
- Edit profile option
- General settings:
  - Dark/Light mode toggle
  - Language selection
  - About
  - Terms & Conditions
  - Privacy Policy
  - Rate This App
  - Share This App

## 🎯 Best Practices

### Code Organization
- ✅ Feature-first folder structure
- ✅ Separation of concerns (Data, Domain, Presentation)
- ✅ Reusable widgets in core/widgets
- ✅ Centralized constants and theme
- ✅ Type-safe with strong typing

### Code Quality
- ✅ Clean, readable, and maintainable code
- ✅ Proper naming conventions
- ✅ Comprehensive documentation
- ✅ Modular and reusable components
- ✅ Professional-grade architecture

### State Management
- ✅ Riverpod for reactive state management
- ✅ Provider-based architecture
- ✅ Separation of business logic from UI

## 📝 Adding New Features

To add a new feature, follow this structure:

```
lib/features/your_feature/
├── data/
│   ├── models/
│   ├── repositories/
│   └── datasources/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── pages/
    ├── widgets/
    └── providers/
```

## 🎨 Theme Customization

All theme configurations are centralized in:
- `lib/core/theme/app_colors.dart` - Color definitions
- `lib/core/theme/app_theme.dart` - Material theme setup
- `lib/core/theme/app_text_styles.dart` - Typography styles

## 📄 License

This project is private and proprietary.

## 👨‍💻 Development

Built with ❤️ following software engineering best practices and clean architecture principles.
