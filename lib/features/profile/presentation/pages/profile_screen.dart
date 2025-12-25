import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_ders/features/profile/profile_sub_screens/about_screen.dart';
import 'package:global_ders/features/profile/profile_sub_screens/privacy_policy.dart';
import 'package:global_ders/features/profile/profile_sub_screens/terms_and_condition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../auth/presentation/providers/login_provider.dart';
import '../../../auth/presentation/pages/login_screen.dart';
import '../widgets/profile_header.dart';
import '../widgets/settings_list_item.dart';

/// Profile screen of the educational app
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final bool _isDarkMode = true;

  /// Open app store for rating
  Future<void> _rateApp() async {
    // Replace with your actual app package name and app store ID
    const String androidPackageName = 'com.globalders.app';
    const String iosAppId = '123456789'; // Your iOS App ID

    try {
      final Uri playStoreUri = Uri.parse(
        'https://play.google.com/store/apps/details?id=$androidPackageName',
      );
      final Uri appStoreUri = Uri.parse(
        'https://apps.apple.com/app/id$iosAppId',
      );

      // Try to open Play Store on Android or App Store on iOS
      if (await canLaunchUrl(playStoreUri)) {
        await launchUrl(playStoreUri, mode: LaunchMode.externalApplication);
      } else if (await canLaunchUrl(appStoreUri)) {
        await launchUrl(appStoreUri, mode: LaunchMode.externalApplication);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Could not open app store'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  /// Share app with others
  Future<void> _shareApp() async {
    const String appName = 'Global Ders';
    const String appDescription =
        'Learn mathematics and more with Global Ders - Your educational companion!';
    const String playStoreLink =
        'https://play.google.com/store/apps/details?id=com.globalders.app';
    const String appStoreLink = 'https://apps.apple.com/app/id123456789';

    final String shareText =
        '''
$appName

$appDescription

Download now:
Android: $playStoreLink
iOS: $appStoreLink
''';

    try {
      await Share.share(shareText, subject: 'Check out $appName!');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error sharing: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get current user data
    final userAsync = ref.watch(currentUserProvider);

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
            // Profile Header with user data
            Align(
              alignment: Alignment.center,
              child: userAsync.when(
                data: (user) {
                  return ProfileHeader(
                    userName: user?.name ?? 'Not available',
                    userEmail: user?.email ?? 'Not available',
                    avatarUrl: user?.avatarUrl,
                  );
                },
                loading: () => const ProfileHeader(
                  userName: 'Loading...',
                  userEmail: 'Please wait...',
                ),
                error: (error, stack) => const ProfileHeader(
                  userName: 'Not available',
                  userEmail: 'Not available',
                ),
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

            // // Mode Toggle
            // SettingsListItem(
            //   icon: Icons.brightness_6_rounded,
            //   title: AppConstants.mode,
            //   subtitle: AppConstants.darkAndLight,
            //   iconBackgroundColor: AppColors.white,
            //   trailing: Switch(
            //     value: _isDarkMode,
            //     onChanged: (value) {
            //       setState(() {
            //         _isDarkMode = value;
            //       });
            //     },
            //   ),
            // ),

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
              onTap: _rateApp,
            ),

            // Share This App
            SettingsListItem(
              icon: Icons.share_rounded,
              title: AppConstants.shareThisApp,
              iconBackgroundColor: AppColors.white,
              onTap: _shareApp,
            ),

            const SizedBox(height: AppConstants.paddingMedium),

            // Logout Button
            SettingsListItem(
              icon: Icons.logout_rounded,
              title: 'Logout',
              iconBackgroundColor: AppColors.error,
              onTap: () async {
                // Show confirmation dialog
                final shouldLogout = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: AppColors.darkSurface,
                    title: Text('Logout', style: AppTextStyles.h5()),
                    content: Text(
                      'Are you sure you want to logout?',
                      style: AppTextStyles.bodyMedium(
                        color: AppColors.darkTextSecondary,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text(
                          'Cancel',
                          style: AppTextStyles.labelMedium(
                            color: AppColors.darkTextSecondary,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text(
                          'Logout',
                          style: AppTextStyles.labelMedium(
                            color: AppColors.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                );

                if (shouldLogout == true && mounted) {
                  // Perform logout
                  await ref.read(loginProvider.notifier).logout();

                  // Navigate to login screen
                  if (mounted) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  }
                }
              },
            ),

            const SizedBox(height: AppConstants.paddingLarge),
          ],
        ),
      ),
    );
  }
}
