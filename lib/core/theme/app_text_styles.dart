import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Centralized text styles using Google Fonts
class AppTextStyles {
  // Private constructor to prevent instantiation
  AppTextStyles._();

  // Base font family
  static String get _fontFamily => GoogleFonts.poppins().fontFamily!;

  // ============ Headings ============

  static TextStyle h1({Color? color}) => GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.darkTextPrimary,
    letterSpacing: -0.5,
  );

  static TextStyle h2({Color? color}) => GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.darkTextPrimary,
    letterSpacing: -0.5,
  );

  static TextStyle h3({Color? color}) => GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.darkTextPrimary,
    letterSpacing: -0.3,
  );

  static TextStyle h4({Color? color}) => GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.darkTextPrimary,
    letterSpacing: -0.2,
  );

  static TextStyle h5({Color? color}) => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.darkTextPrimary,
  );

  static TextStyle h6({Color? color}) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.darkTextPrimary,
  );

  // ============ Body Text ============

  static TextStyle bodyLarge({Color? color}) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: color ?? AppColors.darkTextPrimary,
    height: 1.5,
  );

  static TextStyle bodyMedium({Color? color}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: color ?? AppColors.darkTextPrimary,
    height: 1.5,
  );

  static TextStyle bodySmall({Color? color}) => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: color ?? AppColors.darkTextSecondary,
    height: 1.4,
  );

  // ============ Labels & Buttons ============

  static TextStyle labelLarge({Color? color}) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.darkTextPrimary,
    letterSpacing: 0.1,
  );

  static TextStyle labelMedium({Color? color}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.darkTextPrimary,
    letterSpacing: 0.1,
  );

  static TextStyle labelSmall({Color? color}) => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.darkTextSecondary,
    letterSpacing: 0.1,
  );

  static TextStyle button({Color? color}) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.darkTextPrimary,
    letterSpacing: 0.2,
  );

  // ============ Special Styles ============

  static TextStyle caption({Color? color}) => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: color ?? AppColors.darkTextTertiary,
    height: 1.3,
  );

  static TextStyle overline({Color? color}) => GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.darkTextTertiary,
    letterSpacing: 1.5,
  );

  // ============ Custom App-Specific Styles ============

  static TextStyle sectionTitle({Color? color}) => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.darkTextPrimary,
  );

  static TextStyle chipText({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.darkTextPrimary,
      );

  static TextStyle navLabel({Color? color}) => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.darkTextSecondary,
  );

  static TextStyle searchHint({Color? color}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: color ?? AppColors.darkTextTertiary,
  );

  static TextStyle userName({Color? color}) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.darkTextPrimary,
  );

  static TextStyle userEmail({Color? color}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: color ?? AppColors.darkTextSecondary,
  );

  static TextStyle settingsTitle({Color? color}) => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: color ?? AppColors.darkTextPrimary,
  );

  static TextStyle settingsSubtitle({Color? color}) => GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: color ?? AppColors.darkTextSecondary,
  );
}
