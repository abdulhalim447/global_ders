import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../auth/presentation/providers/login_provider.dart';
import '../../../auth/presentation/pages/login_screen.dart';
import '../../../profile/profile_sub_screens/about_screen.dart';
import '../../../profile/profile_sub_screens/privacy_policy.dart';
import '../../../profile/profile_sub_screens/terms_and_condition.dart';

/// Custom navigation drawer for home screen
class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  /// Open app store for rating
  Future<void> _rateApp(BuildContext context) async {
    const String androidPackageName = 'com.globalders.app';
    const String iosAppId = '123456789';

    try {
      final Uri playStoreUri = Uri.parse(
        'https://play.google.com/store/apps/details?id=$androidPackageName',
      );
      final Uri appStoreUri = Uri.parse(
        'https://apps.apple.com/app/id$iosAppId',
      );

      if (await canLaunchUrl(playStoreUri)) {
        await launchUrl(playStoreUri, mode: LaunchMode.externalApplication);
      } else if (await canLaunchUrl(appStoreUri)) {
        await launchUrl(appStoreUri, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Could not open app store'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
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
  Future<void> _shareApp(BuildContext context) async {
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
      if (context.mounted) {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);

    return Drawer(
      backgroundColor: AppColors.darkBackground,
      child: SafeArea(
        child: Column(
          children: [
            // User Profile Header
            userAsync.when(
              data: (user) => _buildUserHeader(
                context,
                userName: user?.name ?? 'Not available',
                userEmail: user?.email ?? 'Not available',
                avatarUrl: user?.avatarUrl,
              ),
              loading: () => _buildUserHeader(
                context,
                userName: 'Loading...',
                userEmail: 'Please wait...',
              ),
              error: (error, stack) => _buildUserHeader(
                context,
                userName: 'Not available',
                userEmail: 'Not available',
              ),
            ),

            const Divider(color: AppColors.darkSurfaceVariant, height: 1),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(height: AppConstants.paddingMedium),

                  // General Settings Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingMedium,
                      vertical: AppConstants.paddingSmall,
                    ),
                    child: Text(
                      AppConstants.generalSettings,
                      style: AppTextStyles.labelSmall(
                        color: AppColors.darkTextTertiary,
                      ),
                    ),
                  ),

                  // About
                  _buildDrawerItem(
                    context,
                    icon: Icons.help_outline_rounded,
                    title: AppConstants.about,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutScreen(),
                        ),
                      );
                    },
                  ),

                  // Terms & Conditions
                  _buildDrawerItem(
                    context,
                    icon: Icons.description_outlined,
                    title: AppConstants.termsAndConditions,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TermsAndCondition(),
                        ),
                      );
                    },
                  ),

                  // Privacy Policy
                  _buildDrawerItem(
                    context,
                    icon: Icons.lock_outline_rounded,
                    title: AppConstants.privacyPolicy,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicy(),
                        ),
                      );
                    },
                  ),

                  // Rate This App
                  _buildDrawerItem(
                    context,
                    icon: Icons.star_outline_rounded,
                    title: AppConstants.rateThisApp,
                    onTap: () {
                      Navigator.pop(context);
                      _rateApp(context);
                    },
                  ),

                  // Share This App
                  _buildDrawerItem(
                    context,
                    icon: Icons.share_rounded,
                    title: AppConstants.shareThisApp,
                    onTap: () {
                      Navigator.pop(context);
                      _shareApp(context);
                    },
                  ),

                  const Divider(
                    color: AppColors.darkSurfaceVariant,
                    height: 32,
                  ),

                  // Logout
                  _buildDrawerItem(
                    context,
                    icon: Icons.logout_rounded,
                    title: 'Logout',
                    iconColor: AppColors.error,
                    onTap: () async {
                      Navigator.pop(context);

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

                      if (shouldLogout == true && context.mounted) {
                        // Perform logout
                        await ref.read(loginProvider.notifier).logout();

                        // Navigate to login screen
                        if (context.mounted) {
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
          ],
        ),
      ),
    );
  }

  Widget _buildUserHeader(
    BuildContext context, {
    required String userName,
    required String userEmail,
    String? avatarUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      child: Column(
        children: [
          // Avatar
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.accentGreen, width: 3),
            ),
            child: ClipOval(
              child: avatarUrl != null && avatarUrl.isNotEmpty
                  ? Image.network(
                      avatarUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.darkSurface,
                          child: const Icon(
                            Icons.person_rounded,
                            size: 40,
                            color: AppColors.darkIconSecondary,
                          ),
                        );
                      },
                    )
                  : Container(
                      color: AppColors.darkSurface,
                      child: const Icon(
                        Icons.person_rounded,
                        size: 40,
                        color: AppColors.darkIconSecondary,
                      ),
                    ),
            ),
          ),

          const SizedBox(height: AppConstants.paddingMedium),

          // User Name
          Text(
            userName,
            style: AppTextStyles.h5(color: AppColors.darkTextPrimary),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppConstants.paddingXSmall),

          // User Email
          Text(
            userEmail,
            style: AppTextStyles.bodySmall(color: AppColors.darkTextSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? AppColors.darkIconPrimary,
        size: 24,
      ),
      title: Text(
        title,
        style: AppTextStyles.bodyMedium(
          color: iconColor ?? AppColors.darkTextPrimary,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingLarge,
        vertical: AppConstants.paddingXSmall,
      ),
    );
  }
}
