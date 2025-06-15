// widgets/account_detail_dialog.dart
import 'package:flutter/material.dart';
import 'package:task_app/features/review_accounts/data/account_model.dart';
import 'package:task_app/core/theme/app_colors.dart';
import 'package:task_app/core/theme/app_styles.dart';
import 'package:task_app/core/constant/app_assets.dart';
import 'package:task_app/core/constant/app_strings.dart';
import 'package:task_app/core/utils/responsive_layout.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import 'package:task_app/features/review_accounts/presentation/widgets/shared_account_widgets.dart' as shared;

// Common styles
class AccountDetailStyles {
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

// Reusable widgets
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

class DetailRowItem extends StatelessWidget {
  final String iconPath;
  final String text;
  final Color? textColor;
  final double iconSize;

  const DetailRowItem({
    super.key,
    required this.iconPath,
    required this.text,
    this.textColor,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          iconPath,
          width: iconSize,
          height: iconSize,
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            style: AppStyles.bodyText1.copyWith(
              color: textColor ?? AppColors.mediumGreyText,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

class DateInfoRow extends StatelessWidget {
  final String iconPath;
  final String label;
  final String date;

  const DateInfoRow({
    super.key,
    required this.iconPath,
    required this.label,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          width: 14,
          height: 14,
          color: AppColors.mediumGreyText,
        ),
        const SizedBox(width: 4),
        Text(
          '$label: $date',
          style: AppStyles.bodyText2.copyWith(color: AppColors.mediumGreyText),
        ),
      ],
    );
  }
}

class StatColumn extends StatelessWidget {
  final String value;
  final String label;

  const StatColumn({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppStyles.headline3.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppStyles.bodyText2.copyWith(color: AppColors.mediumGreyText),
        ),
      ],
    );
  }
}

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
    return Container(
      margin: const EdgeInsets.all(40),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Text(
            message,
            style: AppStyles.bodyText1.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// Main dialog widget
class AccountDetailDialog extends StatefulWidget {
  final List<AccountModel> accounts;
  final int initialIndex;
  final Function(int)? onPageChanged;

  const AccountDetailDialog({
    super.key,
    required this.accounts,
    required this.initialIndex,
    this.onPageChanged,
  });

  @override
  State<AccountDetailDialog> createState() => _AccountDetailDialogState();
}

class _AccountDetailDialogState extends State<AccountDetailDialog> {
  late int _currentIndex;
  final ValueNotifier<bool> _showActionButtons = ValueNotifier<bool>(true);
  final ValueNotifier<Map<String, dynamic>?> _currentStatus =
      ValueNotifier<Map<String, dynamic>?>(null);

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  void dispose() {
    _showActionButtons.dispose();
    _currentStatus.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMM, yyyy');
    return formatter.format(date);
  }

  Widget _buildStatsWidget(AccountModel account) {
    if (account.platform == 'WhatsApp') {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: shared.AccountStyles.statsContainerDecoration,
        child: Text(
          AppStrings.whatsappId,
          style: AppStyles.bodyText1.copyWith(color: AppColors.mediumGreyText),
        ),
      );
    } else if (account.platform == 'Facebook') {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: shared.AccountStyles.statsContainerDecoration,
        child: shared.StatColumn(
          value: account.friends.toString(),
          label: AppStrings.friends,
        ),
      );
    } else {
      return Container(
        width: MediaQuery.of(context).size.width * 0.2,
       
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: shared.AccountStyles.statsContainerDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: shared.StatColumn(
                value: account.followers.toString(),
                label: AppStrings.followers,
              ),
            ),
            Expanded(
              child: shared.StatColumn(
                value: account.following.toString(),
                label: AppStrings.following,
              ),
            ),
            Expanded(
              child: shared.StatColumn(
                value: account.posts.toString(),
                label: AppStrings.posts,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final AccountModel account = widget.accounts[_currentIndex];
    final isMobile = ResponsiveLayout.isMobile(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Responsive dimensions
    final dialogWidth = isMobile ? screenWidth : screenWidth * 0.6;
    final dialogHeight = isMobile ? screenHeight : screenHeight * 0.7;
    final horizontalPadding = isMobile ? 16.0 : 40.0;
    final profileImageSize = isMobile ? 60.0 : 78.0;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Container(
              width: dialogWidth,
              height: dialogHeight,
              decoration: shared.AccountStyles.dialogDecoration,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: AppColors.mediumGreyText,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Column(
                        children: [
                          shared.ProfileImage(
                            imageUrl: account.profileImageUrl,
                            size: profileImageSize,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            account.name,
                            style: AppStyles.headline2.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          // Detail rows
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  shared.DetailRowItem(
                                    iconPath: AppAssets.ukFlag,
                                    text: account.location,
                                  ),
                                  const SizedBox(width: 8),
                                  shared.DetailRowItem(
                                    iconPath: AppAssets.female,
                                    text: '${account.age}',
                                  ),
                                  const SizedBox(width: 8),
                                  shared.DetailRowItem(
                                    iconPath: AppAssets.Brand,
                                    text: '${AppStrings.id}: ${account.id}',
                                  ),
                                  const SizedBox(width: 8),
                                  shared.DetailRowItem(
                                    iconPath: shared.PlatformChip(platform: account.platform).getPlatformIcon(account.platform),
                                    text: account.username.isNotEmpty
                                        ? account.username
                                        : account.platform,
                                  ),
                                  const SizedBox(width: 8),
                                  shared.DetailRowItem(
                                    iconPath: AppAssets.email,
                                    text: account.email,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Date info rows
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  shared.DetailRowItem(
                                    iconPath: AppAssets.calendar,
                                    text: '${AppStrings.joined}: ${_formatDate(account.joinedDate)}',
                                  ),
                                  const SizedBox(width: 8),
                                  shared.DetailRowItem(
                                    iconPath: AppAssets.clock,
                                    text: '${AppStrings.lastSeen}: ${_formatDate(account.lastSeen)}',
                                  ),
                                  const SizedBox(width: 8),
                                  shared.DetailRowItem(
                                    iconPath: AppAssets.clock,
                                    text: '${AppStrings.lastPost}: ${_formatDate(account.lastPost)}',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: shared.AccountStyles.platformCardDecoration,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  AppStrings.tryingToConnect,
                                  style: AppStyles.bodyText1.copyWith(
                                    color: AppColors.mediumGreyText,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      shared.PlatformChip(platform: account.platform).getPlatformIcon(account.platform),
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      account.platform,
                                      style: AppStyles.subtitle1.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  account.username.isNotEmpty
                                      ? account.username
                                      : account.whatsappId,
                                  style: AppStyles.headline3.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                _buildStatsWidget(account),
                                const SizedBox(height: 20),
                                TextButton.icon(
                                  onPressed: () {
                                    // TODO: Implement navigation to social media profile
                                  },
                                  icon: const Icon(Icons.open_in_new, size: 16),
                                  label: Text(
                                    '${AppStrings.goTo} ${account.platform} ${AppStrings.profile}',
                                    style: AppStyles.bodyText1.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryBlue,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.primaryBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Navigation buttons for mobile
                  if (isMobile)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Previous button
                          IconButton(
                            onPressed: _currentIndex > 0
                                ? () {
                                    setState(() {
                                      _currentIndex--;
                                      _showActionButtons.value = true;
                                      _currentStatus.value = null;
                                    });
                                    widget.onPageChanged?.call(_currentIndex);
                                  }
                                : null,
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: AppColors.primaryBlue,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.greyBackground,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Page indicator
                          Text(
                            '${_currentIndex + 1} / ${widget.accounts.length}',
                            style: AppStyles.bodyText1.copyWith(
                              color: AppColors.mediumGreyText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Next button
                          IconButton(
                            onPressed: _currentIndex < widget.accounts.length - 1
                                ? () {
                                    setState(() {
                                      _currentIndex++;
                                      _showActionButtons.value = true;
                                      _currentStatus.value = null;
                                    });
                                    widget.onPageChanged?.call(_currentIndex);
                                  }
                                : null,
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: AppColors.primaryBlue,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.greyBackground,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ValueListenableBuilder<bool>(
                    valueListenable: _showActionButtons,
                    builder: (context, showButtons, child) {
                      if (showButtons) {
                        return Container(
                          padding: EdgeInsets.all(isMobile ? 16.0 : 40.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _showActionButtons.value = false;
                                    _currentStatus.value = {
                                      'icon': Icons.check_circle_outline,
                                      'message': AppStrings.accountDeclinedSuccessfully,
                                      'color': AppColors.redError,
                                    };
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.redError,
                                    foregroundColor: AppColors.white,
                                    padding: EdgeInsets.symmetric(
                                      vertical: isMobile ? 12.0 : 16.0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.close, size: 18),
                                      const SizedBox(width: 8),
                                      Text(
                                        AppStrings.decline,
                                        style: AppStyles.headline3.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: isMobile ? 8.0 : 16.0),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _showActionButtons.value = false;
                                    _currentStatus.value = {
                                      'icon': Icons.check_circle_outline,
                                      'message': AppStrings.accountApprovedSuccessfully,
                                      'color': AppColors.successfully,
                                    };
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryBlue,
                                    foregroundColor: AppColors.white,
                                    padding: EdgeInsets.symmetric(
                                      vertical: isMobile ? 12.0 : 16.0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.check, size: 18),
                                      const SizedBox(width: 8),
                                      Text(
                                        AppStrings.approve,
                                        style: AppStyles.headline3.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return ValueListenableBuilder<Map<String, dynamic>?>(
                          valueListenable: _currentStatus,
                          builder: (context, statusData, child) {
                            if (statusData != null) {
                              return shared.StatusMessage(
                                icon: statusData['icon'],
                                message: statusData['message'],
                                color: statusData['color'],
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          // Navigation buttons - Only show on desktop
          if (!isMobile) ...[
            Positioned(
              left: (screenWidth - dialogWidth) / 2 - 100,
              top: (screenHeight / 2) - 24,
              child: Container(
                width: 48,
                height: 48,
                decoration: shared.AccountStyles.navigationButtonDecoration,
                child: IconButton(
                  onPressed: () {
                    if (_currentIndex > 0) {
                      setState(() {
                        _currentIndex--;
                        _showActionButtons.value = true;
                        _currentStatus.value = null;
                      });
                      widget.onPageChanged?.call(_currentIndex);
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: AppColors.white,
                  ),
                  color: AppColors.mediumGreyText,
                ),
              ),
            ),
            Positioned(
              right: (screenWidth - dialogWidth) / 2 - 100,
              top: (screenHeight / 2) - 24,
              child: Container(
                width: 48,
                height: 48,
                decoration: shared.AccountStyles.navigationButtonDecoration,
                child: IconButton(
                  onPressed: () {
                    if (_currentIndex < widget.accounts.length - 1) {
                      setState(() {
                        _currentIndex++;
                        _showActionButtons.value = true;
                        _currentStatus.value = null;
                      });
                      widget.onPageChanged?.call(_currentIndex);
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.white,
                  ),
                  color: AppColors.mediumGreyText,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
