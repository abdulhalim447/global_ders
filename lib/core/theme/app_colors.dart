import 'package:flutter/material.dart';

/// App color palette for dark and light themes
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // ============ Dark Theme Colors ============

  // Primary Colors (Dark)
  static const Color darkBackground = Color(0xFF1A1A1A);
  static const Color darkSurface = Color(0xFF2A2A2A);
  static const Color darkSurfaceVariant = Color(0xFF353535);

  // Accent Colors
  static const Color accentGreen = Color(0xFFB4FF39);
  static const Color accentGreenDark = Color(0xFF8FCC2E);

  // Text Colors (Dark)
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB0B0B0);
  static const Color darkTextTertiary = Color(0xFF808080);

  // Icon Colors (Dark)
  static const Color darkIconPrimary = Color(0xFFFFFFFF);
  static const Color darkIconSecondary = Color(0xFFB0B0B0);

  // ============ Light Theme Colors ============

  // Primary Colors (Light)
  static const Color lightBackground = Color(0xFFF5F5F5);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFF0F0F0);

  // Text Colors (Light)
  static const Color lightTextPrimary = Color(0xFF1A1A1A);
  static const Color lightTextSecondary = Color(0xFF666666);
  static const Color lightTextTertiary = Color(0xFF999999);

  // Icon Colors (Light)
  static const Color lightIconPrimary = Color(0xFF1A1A1A);
  static const Color lightIconSecondary = Color(0xFF666666);

  // ============ Common Colors ============

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // Overlay Colors
  static const Color overlayLight = Color(0x1AFFFFFF);
  static const Color overlayMedium = Color(0x33FFFFFF);
  static const Color overlayDark = Color(0x4D000000);

  // Border Colors
  static const Color borderDark = Color(0xFF404040);
  static const Color borderLight = Color(0xFFE0E0E0);

  // Chip Colors
  static const Color chipSelectedBackground = accentGreen;
  static const Color chipSelectedText = Color(0xFF1A1A1A);
  static const Color chipUnselectedBackground = Color(0xFFFFFFFF);
  static const Color chipUnselectedText = Color(0xFF1A1A1A);

  // Bottom Navigation
  static const Color bottomNavSelected = accentGreen;
  static const Color bottomNavUnselected = Color(0xFF808080);
  static const Color bottomNavBackground = Color(0xFF1A1A1A);

  // Gradient Colors
  static const LinearGradient accentGradient = LinearGradient(
    colors: [accentGreen, accentGreenDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [darkBackground, darkSurface],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
