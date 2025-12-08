import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note_model.dart';

/// Local storage service for notes using SharedPreferences
class LocalStorageService {
  static const String _notesKey = 'notes_storage_key';

  final SharedPreferences _prefs;

  LocalStorageService(this._prefs);

  /// Save all notes to local storage
  Future<bool> saveNotes(List<NoteModel> notes) async {
    try {
      final notesJson = notes.map((note) => note.toJson()).toList();
      final notesString = jsonEncode(notesJson);
      return await _prefs.setString(_notesKey, notesString);
    } catch (e) {
      throw Exception('Failed to save notes: $e');
    }
  }

  /// Load all notes from local storage
  Future<List<NoteModel>> loadNotes() async {
    try {
      final notesString = _prefs.getString(_notesKey);

      if (notesString == null || notesString.isEmpty) {
        return [];
      }

      final List<dynamic> notesJson = jsonDecode(notesString);
      return notesJson
          .map((json) => NoteModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to load notes: $e');
    }
  }

  /// Clear all notes from local storage
  Future<bool> clearNotes() async {
    try {
      return await _prefs.remove(_notesKey);
    } catch (e) {
      throw Exception('Failed to clear notes: $e');
    }
  }

  /// Check if notes exist in storage
  bool hasNotes() {
    return _prefs.containsKey(_notesKey);
  }
}
