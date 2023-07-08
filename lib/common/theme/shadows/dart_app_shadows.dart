import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class DarkAppShadows extends AbsThemeShadows {
  const DarkAppShadows();

  @override
  BoxShadow get buttonShadow => const BoxShadow(
        offset: Offset(4, 4),
        blurRadius: 5,
        color: Color.fromARGB(255, 110, 110, 110),
      );

  @override
  BoxShadow get thickTextShadow => const BoxShadow(
        offset: Offset(1, 1),
        blurRadius: 5,
        color: Color.fromARGB(255, 197, 197, 197),
      );

  @override
  BoxShadow get defaultShadow => const BoxShadow(
        offset: Offset(1, 1),
        blurRadius: 3,
        color: Color.fromARGB(255, 81, 81, 81),
      );

  @override
  BoxShadow get textShadow => const BoxShadow(
        offset: Offset(1, 1),
        blurRadius: 3,
        color: Color.fromARGB(255, 81, 81, 81),
      );

  @override
  BoxShadow get buttonShadowSmall => const BoxShadow(
        offset: Offset(1, 1),
        blurRadius: 3,
        color: Color.fromARGB(255, 81, 81, 81),
      );
}
