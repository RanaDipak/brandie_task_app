import 'package:flutter/material.dart';
import 'package:task_app/core/theme/app_colors.dart';
import 'package:task_app/core/theme/app_styles.dart';
import 'package:task_app/core/constant/app_strings.dart';
import 'package:task_app/core/constant/app_assets.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: AppColors.sidebarBackground,
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.logo,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) {
                    return Text(
                      AppStrings.oriflame,
                      style: AppStyles.headline3.copyWith(
                        letterSpacing: 2,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          
          // Menu Items
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
              ),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildMenuItem(AppAssets.dashboard, AppStrings.dashboard, false),
                  _buildMenuItem(AppAssets.sharedContent, AppStrings.sharedContent, false),
                  _buildMenuItem(AppAssets.members, AppStrings.members, false),
                  _buildMenuItem(AppAssets.library, AppStrings.libraryAssets, false),
                  _buildMenuItem(AppAssets.education, AppStrings.educationHub, false),
                  _buildMenuItem(AppAssets.campaigns, AppStrings.campaigns, false),
                  _buildMenuItem(AppAssets.communities, AppStrings.communities, false),
                  _buildMenuItem(AppAssets.hashtags, AppStrings.hashtags, false),

                  _buildMenuItem(AppAssets.aiConsole, AppStrings.aiConsole, false),
                  
                  // Divider
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    height: 1,
                    color: AppColors.greyBorder,
                  ),

                  _buildMenuItem(
                    AppAssets.review, 
                    AppStrings.reviewAccounts, 
                    true,
                    badgeCount: 32,
                  ),
                  
                  _buildMenuItem(AppAssets.notifications, AppStrings.pushNotifications, false),
                  _buildMenuItem(AppAssets.sharing, AppStrings.sharingControls, false),
                  _buildMenuItem(AppAssets.userManagement, AppStrings.userManagement, false),
                  _buildMenuItem(AppAssets.appearance, AppStrings.appearance, false),
                  _buildMenuItem(AppAssets.faq, AppStrings.faqsTutorials, false),
                ],
              ),
            ),
          ),
          
          // Sign Out
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListTile(
              leading: Image.asset(
                AppAssets.signOut,
                width: 20,
                height: 20,
                color: AppColors.redError,
              ),
              title: Text(
                AppStrings.signOut,
                style: AppStyles.subtitle1.copyWith(
                  color: AppColors.redError,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {},
            ),
          ),
          
          // Powered by
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.poweredBy,
                  style: AppStyles.caption.copyWith(
                    fontStyle: FontStyle.italic,
                    color: AppColors.mediumGreyText,
                  ),
                ),
                const SizedBox(width: 4),
                Image.asset(
                  AppAssets.brandie,
                  width: 34,
                  height: 34,
                  fit: BoxFit.contain,
                  color: AppColors.mediumGreyText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String iconPath, String title, bool isSelected, {int? badgeCount}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryBlue.withOpacity(0.1) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Image.asset(
          iconPath,
          width: 20,
          height: 20,
          color: isSelected ? AppColors.primaryBlue : AppColors.mediumGreyText,
        ),
        title: Text(
          title,
          style: AppStyles.bodyText1.copyWith(
            color: isSelected ? AppColors.primaryBlue : AppColors.darkGreyText,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        trailing: badgeCount != null
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.redError,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badgeCount.toString(),
                  style: AppStyles.caption.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : null,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        onTap: () {},
      ),
    );
  }
}
