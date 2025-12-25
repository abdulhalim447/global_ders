import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/pdf_viewer/pdf_view_screen.dart';
import '../../data/models/course_data.dart';
import '../widgets/course_list_item.dart';

/// Konu Test Screen - Shows konu and test buttons for a selected topic
class KonuTestScreen extends StatelessWidget {
  final Topic topic;
  final String moduleName;

  const KonuTestScreen({
    super.key,
    required this.topic,
    required this.moduleName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.darkIconPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              topic.name,
              style: AppTextStyles.h6(color: AppColors.darkTextPrimary),
            ),
            Text(
              moduleName,
              style: AppTextStyles.bodySmall(
                color: AppColors.darkTextSecondary,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header text
              Text('İçerikler', style: AppTextStyles.sectionTitle()),
              const SizedBox(height: AppConstants.paddingMedium),

              // Content items list
              Expanded(
                child: ListView.builder(
                  itemCount: topic.contents.length,
                  itemBuilder: (context, index) {
                    final content = topic.contents[index];
                    return CourseListItem(
                      title: content.title,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfViewScreen(
                              pdfPath: content.pdfPath,
                              isAsset: true,
                              title: '${topic.name} - ${content.title}',
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
