import 'package:flutter/material.dart';

import '../../common.dart';

class LightAppColors extends AbstractThemeColors {
  @override
  Color get drawerBg => const Color.fromARGB(255, 255, 255, 255);

  @override
  Color get iconButton => const Color.fromARGB(255, 0, 0, 0);

  @override
  Color get iconButtonInactivate => const Color.fromARGB(255, 158, 158, 158);

  @override
  Color get inActivate => const Color.fromARGB(255, 200, 207, 220);

  @override
  Color get activate => const Color.fromARGB(255, 63, 72, 95);

  @override
  Color get badgeBg => AppColors.blueGreen;

  @override
  Color get divider => const Color.fromARGB(255, 228, 228, 228);

  @override
  Color get text => AppColors.darkGrey;

  @override
  Color get hintText => AppColors.middleGrey;

  @override
  Color get focusedBorder => AppColors.darkGrey;

  @override
  Color get confirmText => AppColors.blue;
}
