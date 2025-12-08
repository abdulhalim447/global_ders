import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/pdf_viewer/pdf_view_screen.dart';
import '../providers/notes_provider.dart';
import '../models/note_model.dart';

/// Notes screen displaying list of PDF notes
class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesState = ref.watch(notesProvider);

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(child: _buildBody(context, ref, notesState)),
          ],
        ),
      ),
    );
  }

  /// Build header with title
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Row(
        children: [
          // Back button (optional)
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.darkSurface,
              borderRadius: BorderRadius.circular(
                AppConstants.borderRadiusSmall,
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.darkIconPrimary,
              ),
            ),
          ),
          const SizedBox(width: AppConstants.paddingMedium),
          Text('Notes', style: AppTextStyles.h4()),
        ],
      ),
    );
  }

  /// Build body based on state
  Widget _buildBody(BuildContext context, WidgetRef ref, NotesState state) {
    if (state.isLoading && state.notes.isEmpty) {
      return _buildLoadingState();
    }

    if (state.error != null && state.notes.isEmpty) {
      return _buildErrorState(ref, state.error!);
    }

    if (state.notes.isEmpty) {
      return _buildEmptyState();
    }

    return _buildNotesList(context, ref, state);
  }

  /// Build loading state
  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentGreen),
            strokeWidth: 3,
          ),
          SizedBox(height: AppConstants.paddingMedium),
          Text(
            'Loading notes...',
            style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 16),
          ),
        ],
      ),
    );
  }

  /// Build error state
  Widget _buildErrorState(WidgetRef ref, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingLarge),
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.error_outline_rounded,
                size: 64,
                color: AppColors.error,
              ),
            ),
            const SizedBox(height: AppConstants.paddingLarge),
            Text(
              'Oops! Something went wrong',
              style: AppTextStyles.h5(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.paddingSmall),
            Text(
              error,
              style: AppTextStyles.bodyMedium(
                color: AppColors.darkTextSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.paddingLarge),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(notesProvider.notifier).refreshNotes();
              },
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentGreen,
                foregroundColor: AppColors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingLarge,
                  vertical: AppConstants.paddingMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build empty state
  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingLarge),
              decoration: BoxDecoration(
                color: AppColors.darkSurface,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.note_outlined,
                size: 64,
                color: AppColors.darkIconSecondary,
              ),
            ),
            const SizedBox(height: AppConstants.paddingLarge),
            Text(
              'No Notes Available',
              style: AppTextStyles.h5(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.paddingSmall),
            Text(
              'There are no notes to display at the moment.',
              style: AppTextStyles.bodyMedium(
                color: AppColors.darkTextSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Build notes list with pull to refresh
  Widget _buildNotesList(
    BuildContext context,
    WidgetRef ref,
    NotesState state,
  ) {
    return RefreshIndicator(
      onRefresh: () => ref.read(notesProvider.notifier).refreshNotes(),
      color: AppColors.accentGreen,
      backgroundColor: AppColors.darkSurface,
      child: ListView.separated(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        itemCount: state.notes.length,
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppConstants.paddingMedium),
        itemBuilder: (context, index) {
          final note = state.notes[index];
          return _buildNoteCard(context, note, index);
        },
      ),
    );
  }

  /// Build individual note card with professional design
  Widget _buildNoteCard(BuildContext context, NoteModel note, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfViewScreen(pdfPath: note.fullPdfUrl),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkSurface,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: AppColors.accentGreen.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfViewScreen(pdfPath: note.fullPdfUrl),
                ),
              );
            },
            borderRadius: BorderRadius.circular(
              AppConstants.borderRadiusMedium,
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Row(
                children: [
                  // PDF Icon with gradient background
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.accentGreen.withOpacity(0.2),
                          AppColors.accentGreen.withOpacity(0.1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppConstants.borderRadiusSmall,
                      ),
                    ),
                    child: const Icon(
                      Icons.picture_as_pdf_rounded,
                      color: AppColors.accentGreen,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingMedium),

                  // Note details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Note name
                        Text(
                          note.displayName,
                          style: AppTextStyles.h6(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),

                        // File name (if different from pdf_name)
                        if (note.pdfName.isNotEmpty &&
                            note.fileName != note.pdfName)
                          Text(
                            note.fileName,
                            style: AppTextStyles.bodySmall(
                              color: AppColors.darkTextTertiary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                        // Upload date
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              size: 14,
                              color: AppColors.darkTextTertiary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _formatDate(note.uploadedAt),
                              style: AppTextStyles.caption(
                                color: AppColors.darkTextTertiary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Arrow icon
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.accentGreen.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.accentGreen,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Format date string for display
  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays == 0) {
        return 'Today';
      } else if (difference.inDays == 1) {
        return 'Yesterday';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} days ago';
      } else if (difference.inDays < 30) {
        final weeks = (difference.inDays / 7).floor();
        return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
      } else {
        return '${date.day}/${date.month}/${date.year}';
      }
    } catch (e) {
      return dateString;
    }
  }
}
