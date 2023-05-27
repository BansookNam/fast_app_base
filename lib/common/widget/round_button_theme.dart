import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

enum RoundButtonTheme {
  blue(AppColors.blue, Colors.white, AppColors.blue, backgroundColorProvider: blueColorProvider),
  whiteWithBlueBorder(Colors.white, AppColors.darkBlue, AppColors.blue,
      backgroundColorProvider: blueColorProvider),
  blink(AppColors.blue, Colors.white, Colors.black, backgroundColorProvider: blueColorProvider);

  const RoundButtonTheme(
    this.bgColor,
    this.textColor,
    this.borderColor, {
    this.shadowColor = Colors.transparent,
    this.backgroundColorProvider,
  });

  final Color Function(BuildContext context)?
      backgroundColorProvider; //RoundButtonTheme 안에서 Custome Theme 분기가 필요하다면 이렇게 함수로 사용
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final Color shadowColor;
}

Color blueColorProvider(BuildContext context) => context.appColors.blueButtonBackground;

Color Function(BuildContext context) defaultColorProvider(Color color) => blueColorProvider;
