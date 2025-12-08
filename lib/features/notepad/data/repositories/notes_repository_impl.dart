import '../../domain/repositories/notes_repository.dart';
import '../datasources/local_storage_service.dart';
import '../models/note_model.dart';

/// Implementation of NotesRepository with local storage
class NotesRepositoryImpl implements NotesRepository {
  final LocalStorageService _storageService;

  NotesRepositoryImpl(this._storageService);

  @override
  Future<List<NoteModel>> getAllNotes() async {
    try {
      final notes = await _storageService.loadNotes();
      // Sort by updated date, newest first
      notes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      return notes;
    } catch (e) {
      throw Exception('Failed to get all notes: $e');
    }
  }

  @override
  Future<NoteModel?> getNoteById(String id) async {
    try {
      final notes = await _storageService.loadNotes();
      return notes.firstWhere(
        (note) => note.id == id,
        orElse: () => throw Exception('Note not found'),
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> createNote(NoteModel note) async {
    try {
      final notes = await _storageService.loadNotes();
      notes.add(note);
      await _storageService.saveNotes(notes);
    } catch (e) {
      throw Exception('Failed to create note: $e');
    }
  }

  @override
  Future<void> updateNote(NoteModel note) async {
    try {
      final notes = await _storageService.loadNotes();
      final index = notes.indexWhere((n) => n.id == note.id);

      if (index == -1) {
        throw Exception('Note not found');
      }

      notes[index] = note;
      await _storageService.saveNotes(notes);
    } catch (e) {
      throw Exception('Failed to update note: $e');
    }
  }

  @override
  Future<void> deleteNote(String id) async {
    try {
      final notes = await _storageService.loadNotes();
      notes.removeWhere((note) => note.id == id);
      await _storageService.saveNotes(notes);
    } catch (e) {
      throw Exception('Failed to delete note: $e');
    }
  }

  @override
  Future<List<NoteModel>> searchNotes(String query) async {
    try {
      if (query.isEmpty) {
        return getAllNotes();
      }

      final notes = await _storageService.loadNotes();
      final lowercaseQuery = query.toLowerCase();

      final filteredNotes = notes.where((note) {
        return note.title.toLowerCase().contains(lowercaseQuery) ||
            note.content.toLowerCase().contains(lowercaseQuery);
      }).toList();

      // Sort by updated date, newest first
      filteredNotes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      return filteredNotes;
    } catch (e) {
      throw Exception('Failed to search notes: $e');
    }
  }

  @override
  Future<int> getNotesCount() async {
    try {
      final notes = await _storageService.loadNotes();
      return notes.length;
    } catch (e) {
      throw Exception('Failed to get notes count: $e');
    }
  }
}
