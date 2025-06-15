import 'package:flutter/material.dart';
import 'package:task_app/core/theme/app_colors.dart';

class CountrySelector extends StatelessWidget {
  final String flagPath;
  final String countryCode;

  const CountrySelector({
    super.key,
    required this.flagPath,
    required this.countryCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.greyBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Flag image
          Image.asset(
            flagPath,
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 8),
          // Country code
          Text(
            countryCode,
            style: const TextStyle(
              color: AppColors.darkGreyText,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          // Dropdown arrow
          const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.darkGreyText,
            size: 20,
          ),
        ],
      ),
    );
  }
} 