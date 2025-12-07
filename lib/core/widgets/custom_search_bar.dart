import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../constants/app_constants.dart';

/// Custom search bar widget
class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool readOnly;

  const CustomSearchBar({
    super.key,
    this.hintText = AppConstants.searchHint,
    this.onChanged,
    this.onTap,
    this.controller,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.searchBarHeight,
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        readOnly: readOnly,
        style: AppTextStyles.bodyMedium(),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.searchHint(
            color: AppColors.darkTextTertiary,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.darkIconSecondary,
            size: AppConstants.iconSizeMedium,
          ),
          suffixIcon: const Icon(
            Icons.tune_rounded,
            color: AppColors.darkIconSecondary,
            size: AppConstants.iconSizeMedium,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingMedium,
            vertical: AppConstants.paddingMedium,
          ),
        ),
      ),
    );
  }
}
