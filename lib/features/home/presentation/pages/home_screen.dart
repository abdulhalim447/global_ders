import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_ders/core/pdf_viewer/pdf_view_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/custom_chip.dart';
import '../../../notes/providers/notes_provider.dart';
import '../../../auth/presentation/providers/login_provider.dart';
import '../widgets/video_course_card.dart';
import '../widgets/course_list_item.dart';
import '../widgets/recommended_item.dart';
import '../widgets/home_drawer.dart';

/// Home screen of the educational app
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
      drawer: const HomeDrawer(),
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
    // Get current user data
    final userAsync = ref.watch(currentUserProvider);

    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Row(
        children: [
          // Menu button
          Builder(
            builder: (context) {
              return Container(
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
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: AppColors.darkIconPrimary,
                  ),
                ),
              );
            },
          ),

          const SizedBox(width: AppConstants.paddingMedium),

          // User avatar and greeting
          userAsync.when(
            data: (user) {
              return Row(
                children: [
                  // User avatar
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.accentGreen,
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child:
                          user?.avatarUrl != null && user!.avatarUrl!.isNotEmpty
                          ? Image.network(
                              user.avatarUrl!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: AppColors.darkSurface,
                                  child: const Icon(
                                    Icons.person_rounded,
                                    size: 24,
                                    color: AppColors.darkIconSecondary,
                                  ),
                                );
                              },
                            )
                          : Container(
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

                  // User name and greeting
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
                        user?.name ?? 'Guest',
                        style: AppTextStyles.labelMedium(
                          color: AppColors.accentGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            loading: () {
              return Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.accentGreen,
                        width: 2,
                      ),
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
                        'Loading...',
                        style: AppTextStyles.labelMedium(
                          color: AppColors.accentGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            error: (error, stack) {
              return Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.accentGreen,
                        width: 2,
                      ),
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
                        'Guest',
                        style: AppTextStyles.labelMedium(
                          color: AppColors.accentGreen,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),

          const Spacer(),

          // Light mode toggle (UI only)
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
    final notesState = ref.watch(notesProvider);

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

        // Display first two notes from API
        if (notesState.isLoading && notesState.notes.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.paddingLarge),
              child: CircularProgressIndicator(
                color: AppColors.accentGreen,
                strokeWidth: 2,
              ),
            ),
          )
        else if (notesState.error != null && notesState.notes.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Text(
                'Failed to load recommendations',
                style: AppTextStyles.bodySmall(
                  color: AppColors.darkTextSecondary,
                ),
              ),
            ),
          )
        else if (notesState.notes.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.paddingMedium),
              child: Text(
                'No recommendations available',
                style: TextStyle(color: AppColors.darkTextSecondary),
              ),
            ),
          )
        else
          ...notesState.notes.take(2).map((note) {
            return RecommendedItem(
              title: note.displayName,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PdfViewScreen(pdfPath: note.fullPdfUrl),
                  ),
                );
              },
            );
          }).toList(),
      ],
    );
  }
}
