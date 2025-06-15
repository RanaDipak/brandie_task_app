import 'package:flutter/material.dart';
import 'package:task_app/core/theme/app_colors.dart';
import 'package:task_app/core/theme/app_styles.dart';

// Common styles for header-related widgets
class HeaderStyles {
  static const double standardPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double iconSize = 20.0;
  static const double flagSize = 24.0;
  static const double backButtonSize = 50.0;

  static final containerDecoration = BoxDecoration(
    color: AppColors.white,
  );

  static final backButtonDecoration = BoxDecoration(
    border: Border.all(color: AppColors.greyBorder),
    borderRadius: BorderRadius.circular(8),
    color: Colors.transparent,
  );

  static final countrySelectorDecoration = BoxDecoration(
    border: Border.all(color: AppColors.greyBorder),
    borderRadius: BorderRadius.circular(8),
  );
}

// Reusable Back Button widget
class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? subtitle;
  final String? title;

  const BackButtonWidget({
    super.key,
    this.onPressed,
    this.subtitle,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(HeaderStyles.smallPadding),
            width: HeaderStyles.backButtonSize,
            height: HeaderStyles.backButtonSize,
            decoration: HeaderStyles.backButtonDecoration,
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: AppColors.mediumGreyText,
                size: HeaderStyles.iconSize,
              ),
            ),
          ),
          const SizedBox(width: 12),
          if (subtitle != null || title != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: AppStyles.caption,
                  ),
                if (title != null)
                  Text(
                    title!,
                    style: AppStyles.headline1,
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

// Reusable Country Selector widget
class CountrySelector extends StatelessWidget {
  final String flagPath;
  final String countryCode;
  final VoidCallback? onPressed;

  const CountrySelector({
    super.key,
    required this.flagPath,
    required this.countryCode,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: HeaderStyles.smallPadding,
      ),
      decoration: HeaderStyles.countrySelectorDecoration,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: HeaderStyles.smallPadding,
            ),
            child: Image.asset(
              flagPath,
              width: HeaderStyles.flagSize,
              height: HeaderStyles.flagSize,
            ),
          ),
          Text(countryCode, style: AppStyles.bodyText1),
          const SizedBox(width: 16),
          Icon(
            Icons.keyboard_arrow_down,
            size: HeaderStyles.iconSize,
            color: AppColors.mediumGreyText,
          ),
        ],
      ),
    );
  }
} 