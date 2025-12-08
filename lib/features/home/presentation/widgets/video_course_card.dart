import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_constants.dart';

/// Banner card widget displaying a simple image
class VideoCourseCard extends StatelessWidget {
  final String title;
  final String? thumbnailUrl;
  final VoidCallback? onTap;

  const VideoCourseCard({
    super.key,
    required this.title,
    this.thumbnailUrl,
    this.onTap,
  });

  /// Opens the course URL in an external browser
  Future<void> _launchCourseUrl() async {
    final Uri url = Uri.parse('https://www.global-ders.com/courses');

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        child: GestureDetector(
          onTap: _launchCourseUrl,
          child: Image.asset(
            'assets/logo/banner.jpg',
            width: double.infinity,
            height: AppConstants.videoCardHeight,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
