import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Theme mode state notifier
class ThemeModeNotifier extends StateNotifier<bool> {
  ThemeModeNotifier() : super(true) {
    _loadThemeMode();
  }

  static const String _themeKey = 'is_dark_mode';

  /// Load theme mode from storage
  Future<void> _loadThemeMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDarkMode = prefs.getBool(_themeKey) ?? true;
      state = isDarkMode;
    } catch (e) {
      // Default to dark mode on error
      state = true;
    }
  }

  /// Toggle theme mode
  Future<void> toggleTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      state = !state;
      await prefs.setBool(_themeKey, state);
    } catch (e) {
      // Revert on error
      state = !state;
    }
  }

  /// Set specific theme mode
  Future<void> setThemeMode(bool isDarkMode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      state = isDarkMode;
      await prefs.setBool(_themeKey, isDarkMode);
    } catch (e) {
      // Handle error
    }
  }
}

/// Provider for theme mode (true = dark, false = light)
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, bool>((ref) {
  return ThemeModeNotifier();
});
