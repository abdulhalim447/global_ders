import 'package:flutter/material.dart';
import 'package:global_ders/core/pdf_viewer/pdf_view_screen.dart';
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
                    _buildMathBooksSection(),
                    const SizedBox(height: AppConstants.paddingMedium),
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

        // Course list - changes based on selected filter
        ..._getCourseListByFilter(),
      ],
    );
  }

  /// Returns different course lists based on selected filter
  List<Widget> _getCourseListByFilter() {
    switch (_selectedFilterIndex) {
      case 0: // All Levels - Mathematics
        return [
          CourseListItem(
            title: 'Mathematics 01',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PdfViewScreen(
                    pdfPath: 'https://app.global-ders.com/pdf/begginer_1.pdf',
                  ),
                ),
              );
            },
          ),
          CourseListItem(
            title: 'Mathematics 02',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PdfViewScreen(
                    pdfPath: 'https://app.global-ders.com/pdf/begginer_2.pdf',
                  ),
                ),
              );
            },
          ),
          CourseListItem(
            title: 'Mathematics 03',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PdfViewScreen(
                    pdfPath: 'https://app.global-ders.com/pdf/begginer_3.pdf',
                  ),
                ),
              );
            },
          ),
          CourseListItem(
            title: 'Mathematics 01',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PdfViewScreen(
                    pdfPath:
                        'https://app.global-ders.com/pdf/intermidiate_1.pdf',
                  ),
                ),
              );
            },
          ),
          CourseListItem(
            title: 'Mathematics 02',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PdfViewScreen(
                    pdfPath:
                        'https://app.global-ders.com/pdf/intermediate_2.pdf',
                  ),
                ),
              );
            },
          ),
        ];
      case 1: // Beginner - Mathematics
        return [
          CourseListItem(
            title: 'Mathematics 01',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PdfViewScreen(
                    pdfPath: 'https://app.global-ders.com/pdf/begginer_1.pdf',
                  ),
                ),
              );
            },
          ),
          CourseListItem(
            title: 'Mathematics 02',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PdfViewScreen(
                    pdfPath: 'https://app.global-ders.com/pdf/beginer2.pdf',
                  ),
                ),
              );
            },
          ),
          CourseListItem(
            title: 'Mathematics 03',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PdfViewScreen(
                    pdfPath: 'https://app.global-ders.com/pdf/beginer_3.pdf',
                  ),
                ),
              );
            },
          ),
        ];
      case 2: // Intermediate - Mathematics
        return [
          CourseListItem(
            title: 'Mathematics 01',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PdfViewScreen(
                    pdfPath:
                        'https://app.global-ders.com/pdf/intermidiate_1.pdf',
                  ),
                ),
              );
            },
          ),
          CourseListItem(
            title: 'Mathematics 02',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PdfViewScreen(
                    pdfPath:
                        'https://app.global-ders.com/pdf/intermediate_2.pdf',
                  ),
                ),
              );
            },
          ),
        ];
      default:
        return [
          CourseListItem(title: 'Mathematics 01', onTap: () {}),
          CourseListItem(title: 'Mathematics 02', onTap: () {}),
          CourseListItem(title: 'Mathematics 03', onTap: () {}),
        ];
    }
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
