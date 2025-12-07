import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';

/// Contact icon button widget for auth screens
class ContactIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ContactIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        border: Border.all(
          color: AppColors.darkSurfaceVariant.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.darkIconSecondary, size: 24),
      ),
    );
  }
}
