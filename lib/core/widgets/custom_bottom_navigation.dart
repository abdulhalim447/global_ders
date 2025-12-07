import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../constants/app_constants.dart';

/// Custom bottom navigation bar widget
class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.bottomNavHeight,
      decoration: BoxDecoration(
        color: AppColors.bottomNavBackground,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home_rounded,
            label: AppConstants.home,
            index: 0,
            isSelected: currentIndex == 0,
          ),
          _buildNavItem(
            icon: Icons.calendar_today_rounded,
            label: AppConstants.activities,
            index: 1,
            isSelected: currentIndex == 1,
          ),
          _buildCenterButton(),
          _buildNavItem(
            icon: Icons.settings_rounded,
            label: AppConstants.settings,
            index: 3,
            isSelected: currentIndex == 3,
          ),
          _buildNavItem(
            icon: Icons.person_rounded,
            label: AppConstants.profile,
            index: 4,
            isSelected: currentIndex == 4,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? AppColors.bottomNavSelected
                  : AppColors.bottomNavUnselected,
              size: AppConstants.bottomNavIconSize,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.navLabel(
                color: isSelected
                    ? AppColors.bottomNavSelected
                    : AppColors.bottomNavUnselected,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterButton() {
    return Container(
      width: 56,
      height: 56,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: AppColors.accentGradient,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.accentGreen.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () => onTap(2),
        icon: const Icon(Icons.eco_rounded, color: AppColors.black, size: 28),
      ),
    );
  }
}
