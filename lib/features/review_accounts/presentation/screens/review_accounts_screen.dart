import 'package:flutter/material.dart';
import 'package:task_app/core/constant/app_assets.dart';
import 'package:task_app/core/theme/app_colors.dart';
import 'package:task_app/features/review_accounts/data/account_model.dart';
import 'package:task_app/features/review_accounts/data/mock_data.dart';
import 'package:task_app/features/review_accounts/presentation/widgets/account_card_widget.dart';
import 'package:task_app/features/review_accounts/presentation/widgets/filter_bar_widget.dart';
import 'package:task_app/features/review_accounts/presentation/widgets/header_widget.dart';
import 'package:task_app/features/review_accounts/presentation/widgets/sidebar_widget.dart';
import 'package:task_app/core/utils/responsive_layout.dart';
import 'package:task_app/features/review_accounts/presentation/widgets/country_selector.dart';
import 'package:task_app/core/constant/app_strings.dart';

class ReviewAccountsScreen extends StatefulWidget {
  const ReviewAccountsScreen({super.key});

  @override
  State<ReviewAccountsScreen> createState() => _ReviewAccountsScreenState();
}

class _ReviewAccountsScreenState extends State<ReviewAccountsScreen> {
  late List<AccountModel> accounts;
  bool _isArchiveView = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    accounts = MockData.getAccounts();
  }

  void _toggleArchiveView() {
    setState(() {
      _isArchiveView = !_isArchiveView;
    });
  }

  void _goBackToReviewAccounts() {
    setState(() {
      _isArchiveView = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: ResponsiveLayout.isMobile(context)
          ? AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              leading: _isArchiveView
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppColors.black),
                      onPressed: _goBackToReviewAccounts,
                    )
                  : IconButton(
                      icon: const Icon(Icons.menu, color: AppColors.black),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
              title: Text(
                _isArchiveView ? AppStrings.archive : AppStrings.reviewAccounts,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                // Country selector in AppBar
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CountrySelector(
                    flagPath: AppAssets.ukFlag,
                    countryCode: 'UK',
                  ),
                ),
              ],
            )
          : null,
      body: Row(
        children: [
          // Sidebar - Hidden on mobile
          if (!ResponsiveLayout.isMobile(context)) ...[
            SizedBox(
              width: ResponsiveLayout.getSidebarWidth(context),
              child: const SidebarWidget(),
            ),
            // Vertical Divider
            Container(
              width: 1,
              color: AppColors.greyBorder,
            ),
          ],
          
          // Main Content
          Expanded(
            child: Column(
              children: [
                // Header - Only show on desktop
                if (!ResponsiveLayout.isMobile(context))
                  HeaderWidget(
                    isArchiveView: _isArchiveView,
                    onBackButtonPressed: _goBackToReviewAccounts,
                  ),
                
                // Divider
                Container(
                  height: 1,
                  color: AppColors.greyBorder,
                ),
                
                // Filter Bar
                FilterBarWidget(
                  isArchiveView: _isArchiveView,
                  onArchivePressed: _toggleArchiveView,
                ),
                
                // Accounts Grid
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: GridView.builder(
                      padding: ResponsiveLayout.getScreenPadding(context),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: ResponsiveLayout.getGridCrossAxisCount(context),
                        childAspectRatio: ResponsiveLayout.getGridChildAspectRatio(context),
                        crossAxisSpacing: ResponsiveLayout.getGridSpacing(context),
                        mainAxisSpacing: ResponsiveLayout.getGridSpacing(context),
                      ),
                      itemCount: accounts.length,
                      itemBuilder: (context, index) {
                        return AccountCardWidget(
                          account: accounts[index],
                          allAccounts: accounts,
                          index: index,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Drawer for mobile view
      drawer: ResponsiveLayout.isMobile(context)
          ? Drawer(
              child: SafeArea(
                child: Column(
                  children: [
                    // Drawer content
                    const Expanded(
                      child: SidebarWidget(),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}