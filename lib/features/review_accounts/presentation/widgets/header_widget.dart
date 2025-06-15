import 'package:flutter/material.dart';
import 'package:task_app/core/theme/app_styles.dart';
import 'package:task_app/core/constant/app_strings.dart';
import 'package:task_app/features/review_accounts/presentation/widgets/shared_header_widgets.dart' as shared;
import 'package:task_app/core/constant/app_assets.dart';
import 'package:task_app/features/review_accounts/presentation/widgets/country_selector.dart';

class HeaderWidget extends StatelessWidget {
  final bool isArchiveView;
  final VoidCallback? onBackButtonPressed;
  
  const HeaderWidget({
    super.key,
    this.isArchiveView = false,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shared.HeaderStyles.containerDecoration,
      padding: const EdgeInsets.all(shared.HeaderStyles.standardPadding),
      child: Row(
        children: [
          if (isArchiveView)
            shared.BackButtonWidget(
              onPressed: onBackButtonPressed,
              subtitle: AppStrings.goBackToReviewAccounts,
              title: AppStrings.archive,
            )
          else
            Text(
              AppStrings.reviewAccounts,
              style: AppStyles.headline1,
            ),
          const Spacer(),
          CountrySelector(
            flagPath: AppAssets.ukFlag,
            countryCode: 'UK',
          ),
        ],
      ),
    );
  }
}
