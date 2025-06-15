import 'package:flutter/material.dart';
import 'package:task_app/core/theme/app_colors.dart';
import 'package:task_app/core/constant/app_dimensions.dart';

class AppStyles {
  // Private constructor to prevent instantiation
  AppStyles._();

  // Base text styles
  static const TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.darkGreyText, // Mapped from AppColors.textColor
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.darkGreyText,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.darkGreyText, // Mapped from AppColors.textColor
  );

  static const TextStyle subtitle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGreyText, // Mapped from AppColors.textColor
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 14,
    color: AppColors.darkGreyText, // Mapped from AppColors.textColor
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 13,
    color: AppColors.darkGreyText,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.darkGreyText, // Mapped from AppColors.textColor
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white, // Using AppColors.white as per example
  );

  static const TextStyle cardTitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.darkGreyText, // Mapped from AppColors.textColor
  );

  static const TextStyle cardSubtitleStyle = TextStyle(
    fontSize: 12,
    color: AppColors.mediumGreyText, // Mapped from AppColors.accentColor
  );

  static const TextStyle cardMetricValueStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.darkGreyText, // Mapped from AppColors.textColor
  );

  static const TextStyle cardMetricLabelStyle = TextStyle(
    fontSize: 12,
    color: AppColors.mediumGreyText, // Mapped from AppColors.accentColor
  );

  // Account detail text styles
  static const TextStyle profileName = TextStyle(
    fontSize: AppDimensions.fontSizeHeadline,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle platformName = TextStyle(
    fontSize: AppDimensions.fontSizeExtraLarge,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle username = TextStyle(
    fontSize: AppDimensions.fontSizeTitle,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle statsValue = TextStyle(
    fontSize: AppDimensions.fontSizeExtraLarge,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle statsLabel = TextStyle(
    fontSize: AppDimensions.fontSizeMedium,
    color: AppColors.mediumGreyText,
  );
} 