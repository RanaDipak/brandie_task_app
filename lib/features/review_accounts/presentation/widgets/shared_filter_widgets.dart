import 'package:flutter/material.dart';
import 'package:task_app/core/theme/app_colors.dart';
import 'package:task_app/core/theme/app_styles.dart';
import 'package:task_app/core/constant/app_assets.dart';
import 'package:task_app/core/utils/responsive_layout.dart';

// Common styles for filter-related widgets
class FilterStyles {
  // Responsive dimensions
  static double getStandardHeight(BuildContext context) {
    return ResponsiveLayout.isMobile(context) ? 36.0 : 40.0;
  }

  static double getStandardSpacing(BuildContext context) {
    return ResponsiveLayout.isMobile(context) ? 12.0 : 16.0;
  }

  static double getSmallSpacing(BuildContext context) {
    return ResponsiveLayout.isMobile(context) ? 6.0 : 8.0;
  }

  static double getIconSize(BuildContext context) {
    return ResponsiveLayout.isMobile(context) ? 16.0 : 20.0;
  }

  static double getFontSize(BuildContext context) {
    return ResponsiveLayout.isMobile(context) ? 12.0 : 14.0;
  }

  static InputDecoration getSearchFieldDecoration(BuildContext context) {
    return InputDecoration(
      hintStyle: AppStyles.bodyText1.copyWith(
        fontSize: getFontSize(context),
      ),
      prefixIcon: Image.asset(
        AppAssets.searchIcon,
        width: getIconSize(context),
        height: getIconSize(context),
        color: AppColors.mediumGreyText,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.greyBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.greyBorder),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: getStandardSpacing(context),
        vertical: 0,
      ),
      filled: true,
      fillColor: Colors.transparent,
    );
  }

  static BoxDecoration getDropdownDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(color: AppColors.greyBorder),
      borderRadius: BorderRadius.circular(8),
    );
  }

  static ButtonStyle getOutlinedButtonStyle(BuildContext context) {
    return OutlinedButton.styleFrom(
      foregroundColor: AppColors.primaryBlue,
      side: const BorderSide(color: AppColors.greyBorder, width: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getStandardSpacing(context),
      ),
      textStyle: TextStyle(
        fontSize: getFontSize(context),
      ),
    );
  }

  static ButtonStyle getPrimaryButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryBlue,
      foregroundColor: AppColors.white,
      padding: EdgeInsets.symmetric(
        horizontal: getStandardSpacing(context) * 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: TextStyle(
        fontSize: getFontSize(context),
      ),
    );
  }
}

// Reusable Search Field widget
class SearchField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;

  const SearchField({
    super.key,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: FilterStyles.getStandardHeight(context),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(fontSize: FilterStyles.getFontSize(context)),
        decoration: FilterStyles.getSearchFieldDecoration(context).copyWith(
          hintText: hintText,
        ),
      ),
    );
  }
}

// Reusable Dropdown widget
class FilterDropdown extends StatelessWidget {
  final String? value;
  final String hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const FilterDropdown({
    super.key,
    required this.value,
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: FilterStyles.getStandardHeight(context),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: FilterStyles.getSmallSpacing(context) * 1.5,
        ),
        decoration: FilterStyles.getDropdownDecoration(context),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            hint: Text(
              hint,
              style: AppStyles.bodyText1.copyWith(
                fontSize: FilterStyles.getFontSize(context),
              ),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: FilterStyles.getIconSize(context) * 0.8,
              color: AppColors.mediumGreyText,
            ),
            isDense: true,
            dropdownColor: AppColors.white,
            elevation: 2,
            borderRadius: BorderRadius.circular(8),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: AppStyles.bodyText1.copyWith(
                    fontSize: FilterStyles.getFontSize(context),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

// Reusable Icon Button widget
class FilterIconButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback? onPressed;
  final Color? textColor;
  final Color? borderColor;

  const FilterIconButton({
    super.key,
    required this.iconPath,
    required this.label,
    this.onPressed,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: FilterStyles.getStandardHeight(context),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Image.asset(
          iconPath,
          width: FilterStyles.getIconSize(context),
          height: FilterStyles.getIconSize(context),
        ),
        label: Text(
          label,
          style: AppStyles.buttonTextStyle.copyWith(
            color: textColor ?? AppColors.black,
            fontSize: FilterStyles.getFontSize(context),
          ),
        ),
        style: FilterStyles.getOutlinedButtonStyle(context).copyWith(
          side: WidgetStateProperty.all(
            BorderSide(
              color: borderColor ?? AppColors.greyBorder,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

// Reusable Primary Button widget
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? trailingIcon;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: FilterStyles.getStandardHeight(context),
      child: ElevatedButton(
        onPressed: onPressed,
        style: FilterStyles.getPrimaryButtonStyle(context).copyWith(
          backgroundColor: WidgetStateProperty.all(AppColors.primaryBlue),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppStyles.buttonTextStyle.copyWith(
                fontSize: FilterStyles.getFontSize(context),
              ),
            ),
            if (trailingIcon != null) ...[
              SizedBox(width: FilterStyles.getSmallSpacing(context)),
              trailingIcon!,
            ],
          ],
        ),
      ),
    );
  }
} 