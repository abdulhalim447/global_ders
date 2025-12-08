import 'package:flutter/material.dart';
import 'package:global_ders/features/notes/pages/notes_screen.dart';

/// Example usage of NotesScreen in navigation
///
/// You can navigate to the notes screen from anywhere in your app:
///
/// ```dart
/// // Simple navigation
/// Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (context) => const NotesScreen(),
///   ),
/// );
///
/// // Or with named routes
/// Navigator.pushNamed(context, '/notes');
/// ```
///
/// If using named routes, add this to your MaterialApp:
///
/// ```dart
/// MaterialApp(
///   routes: {
///     '/notes': (context) => const NotesScreen(),
///   },
/// )
/// ```
///
/// The NotesScreen will:
/// 1. Automatically fetch notes when opened
/// 2. Display loading state while fetching
/// 3. Show error state if API fails (with retry button)
/// 4. Display notes in beautiful cards
/// 5. Navigate to PDF viewer when card is tapped
/// 6. Support pull-to-refresh

class NotesNavigationExample {
  // Example 1: Navigate from a button
  static void navigateToNotes(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotesScreen()),
    );
  }

  // Example 2: Navigate with slide transition
  static void navigateToNotesWithAnimation(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const NotesScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  // Example 3: Navigate and replace current screen
  static void navigateToNotesAndReplace(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const NotesScreen()),
    );
  }
}
