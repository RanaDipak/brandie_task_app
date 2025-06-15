import 'package:flutter/material.dart';

// Breakpoints for different screen sizes
class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 1000;
  static const double desktop = 1400;
  static const double largeDesktop = 1800;
}

// Responsive layout utilities
class ResponsiveLayout {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < Breakpoints.mobile;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= Breakpoints.mobile &&
      MediaQuery.of(context).size.width < Breakpoints.tablet;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= Breakpoints.tablet &&
      MediaQuery.of(context).size.width < Breakpoints.desktop;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= Breakpoints.desktop;

  // Get cross axis count for grid based on screen width
  static int getGridCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= Breakpoints.largeDesktop) return 5;
    if (width >= Breakpoints.desktop) return 4;
    if (width >= Breakpoints.tablet) return 3;
    if (width >= Breakpoints.mobile) return 2;
    return 1;
  }

  // Get padding based on screen size
  static EdgeInsets getScreenPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
    } else {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    }
  }

  // Get spacing between grid items based on screen size
  static double getGridSpacing(BuildContext context) {
    if (isMobile(context)) {
      return 8;
    } else if (isTablet(context)) {
      return 12;
    } else {
      return 16;
    }
  }

  // Get sidebar width based on screen size
  static double getSidebarWidth(BuildContext context) {
    if (isMobile(context)) {
      return 0; // Hide sidebar on mobile
    } else if (isTablet(context)) {
      return 200;
    } else {
      return 250;
    }
  }

  // Get child aspect ratio for grid items based on screen size
  static double getGridChildAspectRatio(BuildContext context) {
    if (isMobile(context)) {
      return 1.5; // Taller items on mobile
    } else if (isTablet(context)) {
      return 0.9;
    } else {
      return 1.0;
    }
  }
} 