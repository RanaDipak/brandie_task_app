import 'package:flutter/material.dart';
import 'package:task_app/core/theme/app_colors.dart';
import 'package:task_app/core/theme/app_styles.dart';
import 'package:task_app/core/constant/app_strings.dart';
import 'package:task_app/core/constant/app_assets.dart';
import 'package:task_app/features/review_accounts/presentation/widgets/upload_download_btn.dart';
import 'package:task_app/features/review_accounts/presentation/widgets/shared_filter_widgets.dart';
import 'package:task_app/core/utils/responsive_layout.dart';

class FilterBarWidget extends StatefulWidget {
  final bool isArchiveView;
  final VoidCallback? onArchivePressed;
  const FilterBarWidget({
    super.key,
    this.isArchiveView = false,
    this.onArchivePressed,
  });

  @override
  State<FilterBarWidget> createState() => _FilterBarWidgetState();
}

class _FilterBarWidgetState extends State<FilterBarWidget> {
  String? selectedFilter;
  final List<String> filterOptions = [
    AppStrings.dateConnected,
    AppStrings.username,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: ResponsiveLayout.getScreenPadding(context),
      child: ResponsiveLayout.isMobile(context)
          ? _buildMobileLayout()
          : _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Search field
        SearchField(
          hintText: AppStrings.searchHint,
        ),
        SizedBox(height: FilterStyles.getSmallSpacing(context)),
        
        // Sort and filter row
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(AppStrings.sortBy, style: AppStyles.bodyText1),
                  SizedBox(width: FilterStyles.getSmallSpacing(context)),
                  Expanded(
                    child: FilterDropdown(
                      value: selectedFilter,
                      hint: AppStrings.dateConnected,
                      items: filterOptions,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedFilter = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: FilterStyles.getSmallSpacing(context)),
            FilterIconButton(
              iconPath: AppAssets.filterIcon,
              label: AppStrings.filter,
            ),
          ],
        ),
        SizedBox(height: FilterStyles.getSmallSpacing(context)),
        
        // Action buttons row
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntrinsicWidth(
              child: UploadDownloadButtons(
                onUpload: () {
                  print('Upload tapped');
                },
                onDownload: () {
                  print('Download tapped');
                },
              ),
            ),
            if (!widget.isArchiveView) ...[
              SizedBox(width: FilterStyles.getSmallSpacing(context)),
              FilterIconButton(
                iconPath: AppAssets.archiveIcon,
                label: AppStrings.archive,
                onPressed: widget.onArchivePressed,
                textColor: AppColors.primaryBlue,
                borderColor: AppColors.primaryBlue,
              ),
              SizedBox(width: FilterStyles.getSmallSpacing(context)),
              PrimaryButton(
                label: AppStrings.validate,
                trailingIcon: Icon(Icons.arrow_forward, size: 16, color: AppColors.white),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        if (widget.isArchiveView) ...[
          Flexible(
            flex: 2,
            child: SearchField(
              hintText: AppStrings.searchHint,
            ),
          ),
          SizedBox(width: FilterStyles.getSmallSpacing(context)),
          SizedBox(
            height: FilterStyles.getStandardHeight(context),
            child: Center(
              child: Text(AppStrings.sortBy, style: AppStyles.bodyText1),
            ),
          ),
          SizedBox(width: FilterStyles.getSmallSpacing(context)),
          FilterDropdown(
            value: selectedFilter,
            hint: AppStrings.dateConnected,
            items: filterOptions,
            onChanged: (String? newValue) {
              setState(() {
                selectedFilter = newValue;
              });
            },
          ),
          SizedBox(width: FilterStyles.getStandardSpacing(context)),
          SizedBox(
            height: FilterStyles.getStandardHeight(context),
            child: UploadDownloadButtons(
              onUpload: () {
                print('Upload tapped');
              },
              onDownload: () {
                print('Download tapped');
              },
            ),
          ),
          SizedBox(width: FilterStyles.getStandardSpacing(context)),
          FilterIconButton(
            iconPath: AppAssets.filterIcon,
            label: AppStrings.filter,
          ),
        ] else ...[
          Expanded(
            flex: 2,
            child: SearchField(
              hintText: AppStrings.searchHint,
            ),
          ),
          SizedBox(width: FilterStyles.getSmallSpacing(context)),
          SizedBox(
            height: FilterStyles.getStandardHeight(context),
            child: Center(
              child: Text(AppStrings.sortBy, style: AppStyles.bodyText1),
            ),
          ),
          SizedBox(width: FilterStyles.getSmallSpacing(context)),
          FilterDropdown(
            value: selectedFilter,
            hint: AppStrings.dateConnected,
            items: filterOptions,
            onChanged: (String? newValue) {
              setState(() {
                selectedFilter = newValue;
              });
            },
          ),
          SizedBox(width: FilterStyles.getStandardSpacing(context)),
          SizedBox(
            height: FilterStyles.getStandardHeight(context),
            child: UploadDownloadButtons(
              onUpload: () {
                print('Upload tapped');
              },
              onDownload: () {
                print('Download tapped');
              },
            ),
          ),
          SizedBox(width: FilterStyles.getStandardSpacing(context)),
          FilterIconButton(
            iconPath: AppAssets.filterIcon,
            label: AppStrings.filter,
          ),
          SizedBox(width: FilterStyles.getStandardSpacing(context)),
          FilterIconButton(
            iconPath: AppAssets.archiveIcon,
            label: AppStrings.archive,
            onPressed: widget.onArchivePressed,
            textColor: AppColors.primaryBlue,
            borderColor: AppColors.primaryBlue,
          ),
          SizedBox(width: FilterStyles.getStandardSpacing(context)),
          PrimaryButton(
            label: AppStrings.validate,
            trailingIcon: Icon(Icons.arrow_forward, size: 16, color: AppColors.white),
          ),
        ],
      ],
    );
  }
}
