import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/course_data.dart';
import '../widgets/course_list_item.dart';
import 'konu_test_screen.dart';

/// Topic Screen - Shows list of topics for a selected module
class TopicScreen extends StatelessWidget {
  final Module module;

  const TopicScreen({super.key, required this.module});

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
        title: Text(
          module.name,
          style: AppTextStyles.h5(color: AppColors.darkTextPrimary),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header text
              Text('Konular', style: AppTextStyles.sectionTitle()),
              const SizedBox(height: AppConstants.paddingMedium),

              // Topics list
              Expanded(
                child: ListView.builder(
                  itemCount: module.topics.length,
                  itemBuilder: (context, index) {
                    final topic = module.topics[index];
                    return CourseListItem(
                      title: topic.name,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KonuTestScreen(
                              topic: topic,
                              moduleName: module.name,
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
