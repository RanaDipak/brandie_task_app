import 'package:flutter/material.dart';
import 'package:task_app/core/theme/app_colors.dart';
import 'package:task_app/features/review_accounts/data/account_model.dart';
import 'package:task_app/core/theme/app_styles.dart';
import 'package:task_app/core/constant/app_strings.dart';
import 'package:task_app/core/constant/app_assets.dart';
import 'package:task_app/features/review_accounts/presentation/widgets/account_detail_dialog.dart';
import 'package:task_app/features/review_accounts/presentation/widgets/shared_account_widgets.dart' as shared;
import 'package:task_app/core/utils/responsive_layout.dart';

class ActionButtonsWidget extends StatelessWidget {
  final VoidCallback? onReject;
  final VoidCallback? onAccept;
  final bool showButtons;

  const ActionButtonsWidget({
    super.key,
    this.onReject,
    this.onAccept,
    this.showButtons = false,
  });

  @override
  Widget build(BuildContext context) {
    if (!showButtons) return const SizedBox.shrink();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildActionButton(
          context,
          color: AppColors.redError,
          icon: Icons.close,
          onTap: onReject,
        ),
        SizedBox(width: 8),
        _buildActionButton(
          context,
          color: AppColors.primaryBlue,
          icon: Icons.check,
          onTap: onAccept,
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required Color color,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    final size = ResponsiveLayout.isMobile(context) ? 28.0 : 32.0;
    final iconSize = ResponsiveLayout.isMobile(context) ? 14.0 : 16.0;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.white, size: iconSize),
        ),
      ),
    );
  }
}

class AccountCardWidget extends StatefulWidget {
  final AccountModel account;
  final List<AccountModel> allAccounts;
  final int index;

  const AccountCardWidget({
    super.key,
    required this.account,
    required this.allAccounts,
    required this.index,
  });

  @override
  State<AccountCardWidget> createState() => _AccountCardWidgetState();
}

class _AccountCardWidgetState extends State<AccountCardWidget> {
  bool isHovered = false;
  void _showAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AccountDetailDialog(
          accounts: widget.allAccounts,
          initialIndex: widget.index,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final padding = ResponsiveLayout.getScreenPadding(context);
    final spacing = 16.0;
    final smallSpacing = 8.0;
    final profileSize = isMobile ? 40.0 : 48.0;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: () => _showAccountDialog(context),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: padding.horizontal / 2,
            vertical: smallSpacing,
          ),
          padding: EdgeInsets.all(spacing),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.greyBorder.withOpacity(0.5)),
            boxShadow: [
              BoxShadow(
                color: AppColors.lightGreyText.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Row(
                children: [
                  shared.ProfileImage(
                    imageUrl: widget.account.profileImageUrl,
                    size: profileSize,
                  ),
                  SizedBox(width: spacing),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.account.name,
                          style: AppStyles.headline3.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: isMobile ? 14 : 16,
                          ),
                        ),
                        SizedBox(height: smallSpacing / 2),
                        shared.DetailRowItem(
                          iconPath: AppAssets.Brand,
                          text: '${AppStrings.id}: ${widget.account.id}',
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: spacing),

              // Divider line
              Container(
                height: 1,
                color: AppColors.greyBorder.withOpacity(0.5),
              ),

              SizedBox(height: spacing),

              // Social Platform Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      shared.PlatformChip(
                        platform: widget.account.platform,
                        fontSize: isMobile ? 12 : 14,
                      ),
                      SizedBox(height: smallSpacing),
                      Text(
                        widget.account.username,
                        style: AppStyles.subtitle1.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.mediumGreyText,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                    ],
                  ),
                  ActionButtonsWidget(
                    showButtons: isHovered,
                    onReject: () {
                      // Handle reject action
                    },
                    onAccept: () {
                      // Handle accept action
                    },
                  ),
                ],
              ),
              SizedBox(height: spacing),

              // Stats
              if (widget.account.platform == 'WhatsApp')
                Container(
                  padding: EdgeInsets.symmetric(vertical: smallSpacing / 2),
                  decoration: shared.AccountStyles.statsContainerDecoration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: shared.StatColumn(
                          value: widget.account.whatsappId,
                          label: AppStrings.whatsappId,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                    ],
                  ),
                )
              else if (widget.account.platform == 'Facebook' &&
                  widget.account.friends > 0)
                Container(
                  padding: EdgeInsets.symmetric(vertical: smallSpacing / 2),
                  decoration: shared.AccountStyles.statsContainerDecoration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: shared.StatColumn(
                          value: widget.account.friends.toString(),
                          label: AppStrings.friends,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                    ],
                  ),
                )
              else
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: smallSpacing / 2,
                    horizontal: smallSpacing,
                  ),
                  decoration: shared.AccountStyles.statsContainerDecoration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: shared.StatColumn(
                          value: widget.account.followers.toString(),
                          label: AppStrings.followers,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                      Container(
                        height: 32,
                        width: 1,
                        color: AppColors.greyBorder.withOpacity(0.5),
                      ),
                      Expanded(
                        child: shared.StatColumn(
                          value: widget.account.following.toString(),
                          label: AppStrings.following,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                      Container(
                        height: 32,
                        width: 1,
                        color: AppColors.greyBorder.withOpacity(0.5),
                      ),
                      Expanded(
                        child: shared.StatColumn(
                          value: widget.account.posts.toString(),
                          label: AppStrings.posts,
                          fontSize: isMobile ? 12 : 14,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
