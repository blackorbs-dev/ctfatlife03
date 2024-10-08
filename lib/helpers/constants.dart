import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Spacing {
  static const double x0 = 0;
  static const double x1 = 2;
  static const double x2 = 4;
  static const double x3 = 8;
  static const double x4 = 16;
  static const double x5 = 24;
  static const double x6 = 32;
}

class AppColor{
  static const primary = Color(0xFFF6B403);
  static const secondary = Color(0xFF3E2F01);
  static const container = Color(0xFF807564);
  static const back = Color(0xFFFDF5E1);
  static const white100 = Color(0xFEE3E3E2);
}

class ScreenUtils{
  bool get isMobileDevice => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  bool get isDesktopDevice => !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
  bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
  bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;

  ScreenSize getScreenSize(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).shortestSide;
    if (deviceWidth > ScreenSize.extraLarge.size) return ScreenSize.extraLarge;
    if (deviceWidth > ScreenSize.large.size) return ScreenSize.large;
    if (deviceWidth > ScreenSize.normal.size) return ScreenSize.normal;
    return ScreenSize.small;
  }
}

enum ScreenSize {
  small(300),
  normal(400),
  large(600),
  extraLarge(1200);

  final double size;
  const ScreenSize(this.size);
}