import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget desktopScreen;
  final Widget? tabletScreen;
  final Widget? mobileScreen;

  const ResponsiveWidget({
    super.key,
    required this.desktopScreen,
    this.tabletScreen,
    this.mobileScreen,
  });

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200 &&
        MediaQuery.of(context).size.width < 1800;
  }

  static bool isTabletScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktopScreen;
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
          return tabletScreen ?? desktopScreen;
        } else {
          return mobileScreen ?? desktopScreen;
        }
      },
    );
  }
}
