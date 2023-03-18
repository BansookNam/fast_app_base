import 'package:fast_app_base/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

export 'package:fast_app_base/common/constant/app_colors.dart';

typedef ColorProvider = Color Function();

abstract class AbstractThemeColors {
  Color get veryBrightGrey => AppColors.brightGrey;

  Color get textBadgeText => Colors.white;

  Color get badgeBorder => Colors.transparent;

  Color get drawerBg => const Color.fromARGB(255, 42, 42, 42);

  Color get iconButton => const Color.fromARGB(255, 255, 255, 255);

  Color get iconButtonInactivate => const Color.fromARGB(255, 131, 131, 131);

  Color get inActivate => const Color.fromARGB(255, 65, 68, 74);

  Color get activate => Colors.white;

  Color get badgeBg => AppColors.darkOrange;

  Color get divider => const Color.fromARGB(255, 93, 93, 93);

  Color get text => Colors.white;

  Color get hintText => AppColors.grey;

  Color get focusedBorder => AppColors.darkGrey;

  Color get confirmText => AppColors.brightBlue;
}
