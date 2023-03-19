import 'package:fast_app_base/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

export 'package:fast_app_base/common/constant/app_colors.dart';

typedef ColorProvider = Color Function();

abstract class AbstractThemeColors {
  Color get background => const Color.fromARGB(255, 16, 16, 16);

  Color get appbarBackground => const Color.fromARGB(255, 16, 16, 18);

  Color get stockBackground => const Color.fromARGB(255, 16, 16, 18);

  Color get layerBackground => const Color.fromARGB(255, 24, 23, 28);

  Color get buttonBackground => const Color.fromARGB(255, 44, 44, 52);

  Color get veryBrightGrey => AppColors.brightGrey;

  Color get textBadgeText => Colors.white;

  Color get badgeBorder => Colors.transparent;

  Color get drawerBg => const Color.fromARGB(255, 42, 42, 42);

  Color get iconButton => const Color.fromARGB(255, 255, 255, 255);

  Color get iconButtonInactivate => const Color.fromARGB(255, 131, 131, 131);

  Color get inActivate => const Color.fromARGB(255, 65, 68, 74);

  Color get activate => Colors.white;

  Color get badgeBg => AppColors.darkOrange;

  Color get divider => const Color.fromARGB(255, 34, 34, 40);

  Color get text => Colors.white;

  Color get dimmedText => const Color.fromARGB(255, 171, 171, 171);

  Color get plus => const Color.fromARGB(255, 230, 71, 83);

  Color get minus => const Color.fromARGB(255, 57, 127, 228);

  Color get dimmedIcon => const Color.fromARGB(255, 171, 171, 171);

  Color get hintText => AppColors.grey;

  Color get focusedBorder => AppColors.darkGrey;

  Color get confirmText => AppColors.brightBlue;

  Color get blueTitleText => AppColors.blue;
}
