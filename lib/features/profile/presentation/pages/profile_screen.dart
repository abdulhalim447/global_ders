import 'package:flutter/material.dart';
import 'package:global_ders/features/profile/profile_sub_screens/about_screen.dart';
import 'package:global_ders/features/profile/profile_sub_screens/privacy_policy.dart';
import 'package:global_ders/features/profile/profile_sub_screens/terms_and_condition.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../widgets/profile_header.dart';
import '../widgets/settings_list_item.dart';

/// Profile screen of the educational app
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
        title: Text(AppConstants.profile, style: AppTextStyles.h5()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Align(
              alignment: Alignment.center,
              child: const ProfileHeader(
                userName: 'User Name',
                userEmail: 'hello@user.com',
              ),
            ),

            // // Edit Profile
            // SettingsListItem(
            //   icon: Icons.edit_rounded,
            //   title: AppConstants.editProfile,
            //   iconBackgroundColor: AppColors.white,
            //   onTap: () {
            //     // Navigate to edit profile
            //   },
            // ),
            const SizedBox(height: AppConstants.paddingMedium),

            // General Settings Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium,
              ),
              child: Text(
                AppConstants.generalSettings,
                style: AppTextStyles.sectionTitle(),
              ),
            ),

            const SizedBox(height: AppConstants.paddingMedium),

            // Mode Toggle
            SettingsListItem(
              icon: Icons.brightness_6_rounded,
              title: AppConstants.mode,
              subtitle: AppConstants.darkAndLight,
              iconBackgroundColor: AppColors.white,
              trailing: Switch(
                value: _isDarkMode,
                onChanged: (value) {
                  setState(() {
                    _isDarkMode = value;
                  });
                },
              ),
            ),

            // // Language
            // SettingsListItem(
            //   icon: Icons.language_rounded,
            //   title: AppConstants.language,
            //   iconBackgroundColor: AppColors.white,
            //   onTap: () {
            //     // Navigate to language settings
            //   },
            // ),

            // About
            SettingsListItem(
              icon: Icons.help_outline_rounded,
              title: AppConstants.about,
              iconBackgroundColor: AppColors.white,
              onTap: () {
                // Navigate to about page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),

            // Terms & Conditions
            SettingsListItem(
              icon: Icons.description_outlined,
              title: AppConstants.termsAndConditions,
              iconBackgroundColor: AppColors.white,
              onTap: () {
                // Navigate to terms & conditions
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsAndCondition(),
                  ),
                );
              },
            ),

            // Privacy Policy
            SettingsListItem(
              icon: Icons.lock_outline_rounded,
              title: AppConstants.privacyPolicy,
              iconBackgroundColor: AppColors.white,
              onTap: () {
                // Navigate to privacy policy
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicy(),
                  ),
                );
              },
            ),

            // Rate This App
            SettingsListItem(
              icon: Icons.star_outline_rounded,
              title: AppConstants.rateThisApp,
              iconBackgroundColor: AppColors.white,
              onTap: () {
                // Open app store rating
              },
            ),

            // Share This App
            SettingsListItem(
              icon: Icons.share_rounded,
              title: AppConstants.shareThisApp,
              iconBackgroundColor: AppColors.white,
              onTap: () {
                // Share app
              },
            ),

            const SizedBox(height: AppConstants.paddingLarge),
          ],
        ),
      ),
    );
  }
}
