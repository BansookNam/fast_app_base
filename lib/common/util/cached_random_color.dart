import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';

class CachedRandomColor {
  static final Map<String, HSLColor> _colorMap = HashMap();
  static final Random _random = Random.secure();

  static Color getColor(String url) {
    if (!_colorMap.containsKey(url)) {
      var rand = _random.nextDouble();

      _colorMap[url] = HSLColor.fromAHSL(
        1,
        360 * rand,
        0.25 + 70 * rand / 100,
        0.85 + 0.1 * rand,
      );
    }
    return _colorMap[url]!.toColor();
  }
}
