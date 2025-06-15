import 'package:flutter/material.dart';
import 'package:task_app/features/review_accounts/presentation/screens/review_accounts_screen.dart';
import 'package:task_app/core/theme/app_theme.dart';

void main() {
  runApp(const OriflameApp());
}

class OriflameApp extends StatelessWidget {
  const OriflameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oriflame Review Accounts',
      theme: AppTheme.lightTheme,
      home: const ReviewAccountsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}