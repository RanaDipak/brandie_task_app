import 'package:flutter/material.dart';
import 'package:task_app/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Satoshi',
      primaryColor: AppColors.primaryBlue,
      hintColor: AppColors.mediumGreyText,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.greyBackground,
        hintStyle: const TextStyle(color: AppColors.mediumGreyText),
        prefixIconColor: AppColors.mediumGreyText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      chipTheme: ChipThemeData(
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      popupMenuTheme: PopupMenuThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: AppColors.white,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.w300, color: AppColors.darkGreyText),
        displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.w300, color: AppColors.darkGreyText),
        displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400, color: AppColors.darkGreyText),
        headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.w400, color: AppColors.darkGreyText),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: AppColors.darkGreyText),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.darkGreyText),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.darkGreyText),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.darkGreyText),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.darkGreyText),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.mediumGreyText),
        labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.lightGreyText),
      ),
    );
  }
} 