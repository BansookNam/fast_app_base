import 'dart:math' as math;

import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/dart/extension/context_extension.dart';
import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color getSwatchByBrightness(int swatchValue) {
    final Brightness brightness = App.navigatorKey.currentContext!.themeType.themeData.brightness;
    if (brightness == Brightness.light) {
      return swatchShade(swatchValue);
    } else {
      return swatchShade(swatchValue + 600);
    }
  }

  /// Get the shade of the color
  Color swatchShade(int swatchValue) =>
      HSLColor.fromColor(this).withLightness(1 - ((math.min(swatchValue, 1000)) / 1000)).toColor();
}
