import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';

/// Settings list item widget
class SettingsListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconBackgroundColor;

  const SettingsListItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppConstants.settingsItemHeight,
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingMedium,
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconBackgroundColor ?? AppColors.white,
                borderRadius: BorderRadius.circular(
                  AppConstants.borderRadiusSmall,
                ),
              ),
              child: Icon(
                icon,
                color: AppColors.black,
                size: AppConstants.iconSizeMedium,
              ),
            ),

            const SizedBox(width: AppConstants.paddingMedium),

            // Title and subtitle
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.settingsTitle()),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(subtitle!, style: AppTextStyles.settingsSubtitle()),
                  ],
                ],
              ),
            ),

            // Trailing widget
            if (trailing != null)
              trailing!
            else
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.darkIconSecondary,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }
}
