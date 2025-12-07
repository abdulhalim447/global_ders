import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../constants/app_constants.dart';

/// Custom filter chip widget
class CustomChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingLarge,
          vertical: AppConstants.paddingSmall + 2,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.chipSelectedBackground
              : AppColors.chipUnselectedBackground,
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
          border: isSelected
              ? null
              : Border.all(
                  color: AppColors.borderDark.withOpacity(0.3),
                  width: 1,
                ),
        ),
        child: Text(
          label,
          style: AppTextStyles.chipText(
            color: isSelected
                ? AppColors.chipSelectedText
                : AppColors.chipUnselectedText,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
