# Notes Feature - Usage Guide

## Overview
Complete notes feature with local storage, CRUD operations, and beautiful UI.

## Quick Start

### 1. Navigate to Notes Screen

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_ders/features/notepad/presentation/pages/notes_list_screen.dart';

// In your navigation or main screen
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const NotesListScreen(),
  ),
);
```

### 2. Add to Bottom Navigation (Optional)

If you want to add notes to your bottom navigation:

```dart
// In your main screen with bottom navigation
BottomNavigationBarItem(
  icon: Icon(Icons.note),
  label: 'Notes',
),

// In the body section
if (_selectedIndex == X) // Replace X with your index
  const NotesListScreen(),
```

## Features Implemented

✅ **Create Notes** - Tap the + button to create a new note
✅ **Edit Notes** - Tap on any note card to edit
✅ **Delete Notes** - Tap delete icon on note card or in editor
✅ **Search Notes** - Tap search icon to filter notes
✅ **Auto-save** - Prompts to save when navigating back with changes
✅ **Local Storage** - All notes saved to device using SharedPreferences
✅ **Empty State** - Beautiful UI when no notes exist
✅ **Loading States** - Smooth loading indicators
✅ **Error Handling** - Graceful error messages

## File Structure

```
lib/features/notepad/
├── data/
│   ├── datasources/
│   │   └── local_storage_service.dart
│   ├── models/
│   │   └── note_model.dart
│   └── repositories/
│       └── notes_repository_impl.dart
├── domain/
│   └── repositories/
│       └── notes_repository.dart
└── presentation/
    ├── pages/
    │   ├── notes_list_screen.dart
    │   └── note_editor_screen.dart
    ├── providers/
    │   └── notes_provider.dart
    └── widgets/
        ├── empty_notes_state.dart
        └── note_card.dart
```

## Data Model

Each note contains:
- **id**: Unique identifier (UUID)
- **title**: Note title
- **content**: Note content
- **createdAt**: Creation timestamp
- **updatedAt**: Last update timestamp

## Testing Checklist

- [ ] Create a new note
- [ ] Edit an existing note
- [ ] Delete a note
- [ ] Search for notes
- [ ] Close and reopen app (verify persistence)
- [ ] Test with empty title
- [ ] Test with long content
- [ ] Test dark mode appearance

## Customization

### Change Colors
Edit `lib/core/theme/app_colors.dart` to customize the accent color.

### Modify Card Layout
Edit `lib/features/notepad/presentation/widgets/note_card.dart` to change the note card appearance.

### Add Features
- Tags/Categories: Add a `tags` field to `NoteModel`
- Rich Text: Replace `TextField` with a rich text editor
- Cloud Sync: Implement a remote data source
