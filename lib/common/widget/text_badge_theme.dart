import 'package:flutter/material.dart';

import '../common.dart';

class TextBadgeTheme {
  factory TextBadgeTheme.basic(BuildContext context) {
    final appColors = context.appColors;
    return TextBadgeTheme._(
      backgroundColor: appColors.badgeBg,
      borderColor: appColors.badgeBorder,
      textColor: Colors.white,
      fontSize: 7,
      borderRadius: 5,
      verticalPadding: 3,
      horizontalPadding: 5,
      borderWidth: 0,
    );
  }

  factory TextBadgeTheme.large(BuildContext context) {
    final appColors = context.appColors;
    return TextBadgeTheme._(
      backgroundColor: appColors.badgeBg,
      borderColor: appColors.badgeBorder,
      textColor: Colors.white,
      fontSize: 15,
      borderRadius: 5,
      verticalPadding: 3,
      horizontalPadding: 5,
      borderWidth: 0,
    );
  }

  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double borderRadius;
  final double verticalPadding;
  final double horizontalPadding;
  final double? borderWidth;
  final Color borderColor;

  const TextBadgeTheme._({
    this.backgroundColor = const Color(0xffE3ECFF),
    required this.textColor,
    required this.fontSize,
    required this.borderRadius,
    required this.verticalPadding,
    required this.horizontalPadding,
    this.borderWidth = 1,
    this.borderColor = Colors.transparent,
  });
}
