/// App-wide constants for the educational app
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // App Information
  static const String appName = 'EduApp';
  static const String appVersion = '1.0.0';

  // API & Network
  static const String baseUrl = 'https://api.example.com';
  static const int connectionTimeout = 30000; // milliseconds
  static const int receiveTimeout = 30000; // milliseconds

  // Dimensions
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusXLarge = 24.0;

  // Padding & Spacing
  static const double paddingXSmall = 4.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  // Spacing (for SizedBox and gaps)
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;

  // Icon Sizes
  static const double iconSizeSmall = 20.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeXLarge = 48.0;

  // Avatar Sizes
  static const double avatarSizeSmall = 40.0;
  static const double avatarSizeMedium = 60.0;
  static const double avatarSizeLarge = 100.0;
  static const double avatarSizeXLarge = 120.0;

  // Animation Durations
  static const int animationDurationShort = 200; // milliseconds
  static const int animationDurationMedium = 300; // milliseconds
  static const int animationDurationLong = 500; // milliseconds

  // Bottom Navigation
  static const double bottomNavHeight = 70.0;
  static const double bottomNavIconSize = 28.0;

  // App Bar
  static const double appBarHeight = 60.0;

  // Search Bar
  static const double searchBarHeight = 50.0;

  // Video Card
  static const double videoCardHeight = 180.0;
  static const double videoCardAspectRatio = 16 / 9;

  // Course Item
  static const double courseItemHeight = 60.0;

  // Settings Item
  static const double settingsItemHeight = 60.0;

  // Strings
  static const String searchHint = 'Search book, program, notes, etc';
  static const String viewAll = 'View All';
  static const String mathBooks = "Math book's";
  static const String recommendedForYou = 'Recommended for you';
  static const String allLevels = 'All Levels';
  static const String beginner = 'Beginner';
  static const String intermediate = 'Intermediate';
  static const String advanced = 'Advanced';

  // Profile Strings
  static const String profile = 'Profile';
  static const String editProfile = 'Edit Profile';
  static const String generalSettings = 'General Settings';
  static const String mode = 'Mode';
  static const String darkAndLight = 'Dark & Light';
  static const String language = 'Language';
  static const String about = 'About';
  static const String termsAndConditions = 'Terms & Conditions';
  static const String privacyPolicy = 'Privacy Policy';
  static const String rateThisApp = 'Rate This App';
  static const String shareThisApp = 'Share This App';

  // Navigation Labels
  static const String home = 'Home';
  static const String activities = 'Notes';
  static const String settings = 'Task';

  // Asset Paths (if needed)
  static const String assetImagesPath = 'assets/images/';
  static const String assetIconsPath = 'assets/icons/';
}
