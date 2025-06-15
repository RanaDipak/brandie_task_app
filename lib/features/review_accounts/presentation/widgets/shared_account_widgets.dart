import 'package:flutter/material.dart';
import 'package:task_app/core/theme/app_colors.dart';
import 'package:task_app/core/theme/app_styles.dart';
import 'package:task_app/core/constant/app_assets.dart';
import 'package:task_app/core/utils/responsive_layout.dart';

// Common styles for account-related widgets
class AccountStyles {
  static final dialogDecoration = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(4),
  );

  static final platformCardDecoration = BoxDecoration(
    color: AppColors.greyBackground.withOpacity(0.5),
    borderRadius: BorderRadius.circular(16),
  );

  static final statsContainerDecoration = BoxDecoration(
    color: AppColors.greyBackground.withOpacity(0.5),
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: AppColors.greyBorder.withOpacity(0.5)),
  );

  static final navigationButtonDecoration = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: AppColors.greyBorder.withOpacity(0.9),
      width: 1,
    ),
  );
}

// Reusable Profile Image widget
class ProfileImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const ProfileImage({
    super.key,
    required this.imageUrl,
    this.size = 78,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.greyBorder.withOpacity(0.5),
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          imageUrl.isNotEmpty ? imageUrl : AppAssets.profilePlaceholder,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Reusable Detail Row Item widget
class DetailRowItem extends StatelessWidget {
  final String iconPath;
  final String text;
  final double? fontSize;

  const DetailRowItem({
    super.key,
    required this.iconPath,
    required this.text,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 6.0 : 8.0,
        vertical: isMobile ? 3.0 : 4.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.greyBackground.withOpacity(0.5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: isMobile ? 14.0 : 16.0,
            height: isMobile ? 14.0 : 16.0,
          ),
          SizedBox(width: isMobile ? 4.0 : 6.0),
          Text(
            text,
            style: AppStyles.bodyText1.copyWith(
              fontSize: isMobile ? 12.0 : 14.0,
              color: AppColors.mediumGreyText,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

// Reusable Stat Column widget
class StatColumn extends StatelessWidget {
  final String value;
  final String label;
  final double? fontSize;

  const StatColumn({
    super.key,
    required this.value,
    required this.label,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppStyles.headline3.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppStyles.bodyText1.copyWith(
            fontSize: fontSize,
            color: AppColors.mediumGreyText,
          ),
        ),
      ],
    );
  }
}

// Reusable Platform Chip widget
class PlatformChip extends StatelessWidget {
  final String platform;
  final double? fontSize;

  const PlatformChip({
    super.key,
    required this.platform,
    this.fontSize,
  });

  String getPlatformIcon(String platform) {
    switch (platform) {
      case 'Instagram':
        return AppAssets.instagram;
      case 'TikTok':
        return AppAssets.tiktok;
      case 'Facebook':
        return AppAssets.facebook;
      case 'WhatsApp':
        return AppAssets.whatsapp;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.lightGreyText.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Image.asset(
            getPlatformIcon(platform),
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 4),
          Text(
            platform,
            style: AppStyles.bodyText1.copyWith(
              fontSize: fontSize,
              color: AppColors.mediumGreyText,
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Status Message widget
class StatusMessage extends StatelessWidget {
  final IconData icon;
  final String message;
  final Color color;

  const StatusMessage({
    super.key,
    required this.icon,
    required this.message,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    
    return Container(
      margin: EdgeInsets.all(isMobile ? 16.0 : 40.0),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.0 : 24.0,
        vertical: isMobile ? 12.0 : 16.0,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: isMobile ? 18.0 : 20.0,
          ),
          SizedBox(width: isMobile ? 8.0 : 12.0),
          Flexible(
            child: Text(
              message,
              style: AppStyles.bodyText1.copyWith(
                color: color,
                fontWeight: FontWeight.w500,
                fontSize: isMobile ? 14.0 : 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
} 