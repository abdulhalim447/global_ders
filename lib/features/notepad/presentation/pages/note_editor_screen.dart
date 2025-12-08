import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/note_model.dart';
import '../providers/notes_provider.dart';

/// Note editor screen for creating and editing notes
class NoteEditorScreen extends ConsumerStatefulWidget {
  final String? noteId;

  const NoteEditorScreen({super.key, this.noteId});

  @override
  ConsumerState<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends ConsumerState<NoteEditorScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final _uuid = const Uuid();

  bool _isLoading = true;
  bool _hasChanges = false;
  NoteModel? _originalNote;

  @override
  void initState() {
    super.initState();
    _loadNote();

    // Track changes
    _titleController.addListener(_onTextChanged);
    _contentController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if (!_hasChanges) {
      setState(() {
        _hasChanges = true;
      });
    }
  }

  Future<void> _loadNote() async {
    if (widget.noteId != null) {
      final repository = ref.read(notesRepositoryProvider);
      final note = await repository.when(
        data: (repo) => repo.getNoteById(widget.noteId!),
        loading: () => null,
        error: (err, stack) => null,
      );

      if (note != null) {
        setState(() {
          _originalNote = note;
          _titleController.text = note.title;
          _contentController.text = note.content;
          _isLoading = false;
          _hasChanges = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<bool> _saveNote() async {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    // Don't save if both title and content are empty
    if (title.isEmpty && content.isEmpty) {
      return false;
    }

    final now = DateTime.now();
    final note = NoteModel(
      id: widget.noteId ?? _uuid.v4(),
      title: title,
      content: content,
      createdAt: _originalNote?.createdAt ?? now,
      updatedAt: now,
    );

    try {
      if (widget.noteId != null) {
        await ref.read(notesNotifierProvider.notifier).updateNote(note);
      } else {
        await ref.read(notesNotifierProvider.notifier).createNote(note);
      }
      return true;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving note: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
      return false;
    }
  }

  Future<void> _deleteNote() async {
    if (widget.noteId == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Note'),
        content: const Text('Are you sure you want to delete this note?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(notesNotifierProvider.notifier).deleteNote(widget.noteId!);
      if (mounted) {
        Navigator.pop(context, true);
      }
    }
  }

  Future<void> _handleBackPress() async {
    if (!_hasChanges) {
      if (mounted) {
        Navigator.pop(context, false);
      }
      return;
    }

    final shouldSave = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Save Changes?'),
        content: const Text('Do you want to save your changes?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Discard'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (shouldSave == true) {
      final saved = await _saveNote();
      if (saved && mounted) {
        Navigator.pop(context, true);
      }
    } else if (shouldSave == false && mounted) {
      Navigator.pop(context, false);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: AppColors.accentGreen),
        ),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        await _handleBackPress();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _handleBackPress,
          ),
          actions: [
            if (widget.noteId != null)
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: _deleteNote,
              ),
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () async {
                final saved = await _saveNote();
                if (saved && mounted) {
                  Navigator.pop(context, true);
                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            children: [
              // Title input
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: AppConstants.spacingSmall,
                  ),
                ),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),

              const SizedBox(height: AppConstants.spacingSmall),

              // Timestamp
              if (_originalNote != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Last edited: ${_originalNote!.relativeTime}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.darkTextTertiary
                          : AppColors.lightTextTertiary,
                    ),
                  ),
                ),

              const SizedBox(height: AppConstants.spacingMedium),

              // Content input
              Expanded(
                child: TextField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                    hintText: 'Start typing...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: AppConstants.spacingSmall,
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
