import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';

/// Profile header widget with avatar and user info
class ProfileHeader extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String? avatarUrl;
  final VoidCallback? onEditProfile;

  const ProfileHeader({
    super.key,
    required this.userName,
    required this.userEmail,
    this.avatarUrl,
    this.onEditProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppConstants.paddingLarge),

        // Avatar
        Container(
          width: AppConstants.avatarSizeLarge,
          height: AppConstants.avatarSizeLarge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.accentGreen, width: 3),
          ),
          child: ClipOval(
            child: avatarUrl != null
                ? Image.network(
                    avatarUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildPlaceholderAvatar(),
                  )
                : _buildPlaceholderAvatar(),
          ),
        ),

        const SizedBox(height: AppConstants.paddingMedium),

        // User Name
        Text(userName, style: AppTextStyles.userName()),

        const SizedBox(height: AppConstants.paddingXSmall),

        // User Email
        Text(userEmail, style: AppTextStyles.userEmail()),

        const SizedBox(height: AppConstants.paddingLarge),
      ],
    );
  }

  Widget _buildPlaceholderAvatar() {
    return Container(
      color: AppColors.darkSurface,
      child: const Icon(
        Icons.person_rounded,
        size: 48,
        color: AppColors.darkIconSecondary,
      ),
    );
  }
}
