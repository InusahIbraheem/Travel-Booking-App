import 'package:flutter/material.dart';

enum ScreenType { mobile, tablet, desktop }

class Responsive {
  static ScreenType of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 1100) return ScreenType.desktop;
    if (width >= 650) return ScreenType.tablet;
    return ScreenType.mobile;
  }

  static bool isMobile(BuildContext context) => of(context) == ScreenType.mobile;
  static bool isTablet(BuildContext context) => of(context) == ScreenType.tablet;
  static bool isDesktop(BuildContext context) => of(context) == ScreenType.desktop;

  static double contentWidth(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 1100) return 1000;
    if (width >= 650) return width * 0.88;
    return width;
  }

  static double contentMaxWidth(BuildContext context) => contentWidth(context);

  static EdgeInsets contentPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 1100) return const EdgeInsets.symmetric(horizontal: 48, vertical: 24);
    if (width >= 650) return const EdgeInsets.symmetric(horizontal: 32, vertical: 20);
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 16);
  }

  static EdgeInsets pagePadding(BuildContext context) => contentPadding(context);
  static EdgeInsets horizontalPadding(BuildContext context) => contentPadding(context);

  static int gridCrossAxisCount(BuildContext context) => gridColumns(context);

  static int gridColumns(BuildContext context, {int mobile = 2, int tablet = 3, int desktop = 4}) {
    return switch (of(context)) {
      ScreenType.desktop => desktop,
      ScreenType.tablet => tablet,
      ScreenType.mobile => mobile,
    };
  }

  static int gridCount(BuildContext context, {int mobile = 2, int tablet = 3, int desktop = 4}) {
    return gridColumns(context, mobile: mobile, tablet: tablet, desktop: desktop);
  }
}

