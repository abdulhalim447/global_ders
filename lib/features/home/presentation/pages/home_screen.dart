import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/custom_search_bar.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../widgets/video_course_card.dart';
import '../widgets/course_list_item.dart';
import '../widgets/recommended_item.dart';

/// Home screen of the educational app
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = [
    AppConstants.allLevels,
    AppConstants.beginner,
    AppConstants.intermediate,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMedium,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppConstants.paddingMedium),
                    const CustomSearchBar(),
                    const SizedBox(height: AppConstants.paddingLarge),
                    _buildMathBooksSection(),
                    const SizedBox(height: AppConstants.paddingLarge),
                    _buildRecommendedSection(),
                    const SizedBox(height: AppConstants.paddingLarge),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Row(
        children: [
          // Menu button
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
              onPressed: () {},
              icon: const Icon(
                Icons.menu_rounded,
                color: AppColors.darkIconPrimary,
              ),
            ),
          ),

          const SizedBox(width: AppConstants.paddingMedium),

          // User avatar and greeting
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.accentGreen, width: 2),
            ),
            child: ClipOval(
              child: Container(
                color: AppColors.darkSurface,
                child: const Icon(
                  Icons.person_rounded,
                  size: 24,
                  color: AppColors.darkIconSecondary,
                ),
              ),
            ),
          ),

          const SizedBox(width: AppConstants.paddingSmall),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello!',
                style: AppTextStyles.bodySmall(
                  color: AppColors.darkTextSecondary,
                ),
              ),
              Text(
                'USER NAME',
                style: AppTextStyles.labelMedium(color: AppColors.accentGreen),
              ),
            ],
          ),

          const Spacer(),

          // Light mode toggle
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
              vertical: AppConstants.paddingXSmall,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(
                AppConstants.borderRadiusLarge,
              ),
            ),
            child: Row(
              children: [
                Text(
                  'LIGHT',
                  style: AppTextStyles.labelSmall(color: AppColors.black),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.wb_sunny_rounded,
                  size: 16,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMathBooksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppConstants.mathBooks, style: AppTextStyles.sectionTitle()),
            TextButton(
              onPressed: () {},
              child: Text(
                AppConstants.viewAll,
                style: AppTextStyles.labelMedium(color: AppColors.accentGreen),
              ),
            ),
          ],
        ),

        const SizedBox(height: AppConstants.paddingMedium),

        // Video card
        const VideoCourseCard(title: "Mathematics"),

        const SizedBox(height: AppConstants.paddingMedium),

        // Filter chips
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _filters.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppConstants.paddingSmall),
            itemBuilder: (context, index) {
              return CustomChip(
                label: _filters[index],
                isSelected: _selectedFilterIndex == index,
                onTap: () {
                  setState(() {
                    _selectedFilterIndex = index;
                  });
                },
              );
            },
          ),
        ),

        const SizedBox(height: AppConstants.paddingMedium),

        // Course list
        const CourseListItem(title: 'Mathematics 01'),
        const CourseListItem(title: 'Mathematics 02'),
        const CourseListItem(title: 'Mathematics 03'),
      ],
    );
  }

  Widget _buildRecommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppConstants.recommendedForYou,
              style: AppTextStyles.sectionTitle(),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                AppConstants.viewAll,
                style: AppTextStyles.labelMedium(color: AppColors.accentGreen),
              ),
            ),
          ],
        ),

        const SizedBox(height: AppConstants.paddingMedium),

        const RecommendedItem(title: 'TYT Exam All notes'),
        const RecommendedItem(title: 'AYT Exam All N...'),
      ],
    );
  }
}
