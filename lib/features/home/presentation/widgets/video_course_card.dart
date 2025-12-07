import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';

/// Video course card widget with play button overlay
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppConstants.videoCardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.darkSurface, AppColors.darkSurfaceVariant],
          ),
        ),
        child: Stack(
          children: [
            // Background pattern or image
            if (thumbnailUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppConstants.borderRadiusMedium,
                ),
                child: Image.network(
                  thumbnailUrl!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _buildPlaceholder(),
                ),
              )
            else
              _buildPlaceholder(),

            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppConstants.borderRadiusMedium,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.transparent,
                    AppColors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),

            // Play button
            Center(
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: AppColors.black,
                  size: 40,
                ),
              ),
            ),

            // Title at bottom
            Positioned(
              left: AppConstants.paddingMedium,
              right: AppConstants.paddingMedium,
              bottom: AppConstants.paddingMedium,
              child: Text(
                title,
                style: AppTextStyles.h6(color: AppColors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.darkSurface, AppColors.darkSurfaceVariant],
        ),
      ),
      child: Center(
        child: Icon(
          Icons.play_circle_outline_rounded,
          size: 64,
          color: AppColors.darkIconSecondary.withOpacity(0.3),
        ),
      ),
    );
  }
}
