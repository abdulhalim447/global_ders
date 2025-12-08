import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note_model.dart';
import '../services/notes_service.dart';

/// Provider for NotesService
final notesServiceProvider = Provider<NotesService>((ref) {
  return NotesService();
});

/// State class for Notes
class NotesState {
  final List<NoteModel> notes;
  final bool isLoading;
  final String? error;

  NotesState({this.notes = const [], this.isLoading = false, this.error});

  NotesState copyWith({
    List<NoteModel>? notes,
    bool? isLoading,
    String? error,
  }) {
    return NotesState(
      notes: notes ?? this.notes,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Notifier for managing notes state
class NotesNotifier extends StateNotifier<NotesState> {
  final NotesService _notesService;

  NotesNotifier(this._notesService) : super(NotesState()) {
    // Automatically fetch notes when provider is initialized
    fetchNotes();
  }

  /// Fetch notes from API
  Future<void> fetchNotes() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _notesService.getNotesList();

      if (response.error) {
        state = state.copyWith(
          isLoading: false,
          error: response.message ?? 'Failed to load notes',
        );
      } else {
        state = state.copyWith(
          notes: response.notes,
          isLoading: false,
          error: null,
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Refresh notes (pull to refresh)
  Future<void> refreshNotes() async {
    await fetchNotes();
  }
}

/// Provider for Notes state
final notesProvider = StateNotifierProvider<NotesNotifier, NotesState>((ref) {
  final notesService = ref.watch(notesServiceProvider);
  return NotesNotifier(notesService);
});
