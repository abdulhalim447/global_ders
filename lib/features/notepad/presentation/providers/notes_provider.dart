import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/datasources/local_storage_service.dart';
import '../../data/models/note_model.dart';
import '../../data/repositories/notes_repository_impl.dart';
import '../../domain/repositories/notes_repository.dart';

/// Provider for SharedPreferences instance
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((
  ref,
) async {
  return await SharedPreferences.getInstance();
});

/// Provider for NotesRepository that waits for SharedPreferences
final notesRepositoryProvider = FutureProvider<NotesRepository>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  final storageService = LocalStorageService(prefs);
  return NotesRepositoryImpl(storageService);
});

/// Notifier for managing notes operations
class NotesNotifier extends StateNotifier<AsyncValue<List<NoteModel>>> {
  final Ref _ref;
  NotesRepository? _repository;

  NotesNotifier(this._ref) : super(const AsyncValue.loading()) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      _repository = await _ref.read(notesRepositoryProvider.future);
      await loadNotes();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Load all notes
  Future<void> loadNotes() async {
    if (_repository == null) return;

    state = const AsyncValue.loading();
    try {
      final notes = await _repository!.getAllNotes();
      state = AsyncValue.data(notes);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Create a new note
  Future<void> createNote(NoteModel note) async {
    if (_repository == null) return;

    try {
      await _repository!.createNote(note);
      await loadNotes();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Update an existing note
  Future<void> updateNote(NoteModel note) async {
    if (_repository == null) return;

    try {
      await _repository!.updateNote(note);
      await loadNotes();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Delete a note
  Future<void> deleteNote(String id) async {
    if (_repository == null) return;

    try {
      await _repository!.deleteNote(id);
      await loadNotes();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

/// Provider for NotesNotifier
final notesNotifierProvider =
    StateNotifierProvider<NotesNotifier, AsyncValue<List<NoteModel>>>((ref) {
      return NotesNotifier(ref);
    });
