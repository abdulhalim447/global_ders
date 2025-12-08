import '../../data/models/note_model.dart';

/// Repository interface for notes operations
abstract class NotesRepository {
  /// Get all notes sorted by updated date (newest first)
  Future<List<NoteModel>> getAllNotes();

  /// Get a single note by ID
  Future<NoteModel?> getNoteById(String id);

  /// Create a new note
  Future<void> createNote(NoteModel note);

  /// Update an existing note
  Future<void> updateNote(NoteModel note);

  /// Delete a note by ID
  Future<void> deleteNote(String id);

  /// Search notes by title or content
  Future<List<NoteModel>> searchNotes(String query);

  /// Get total count of notes
  Future<int> getNotesCount();
}
