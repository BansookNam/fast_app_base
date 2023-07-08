import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class LightAppShadows extends AbsThemeShadows {
  const LightAppShadows();

  @override
  BoxShadow get buttonShadow => const BoxShadow(
        offset: Offset(4, 4),
        blurRadius: 5,
        color: Color.fromARGB(255, 227, 227, 227),
      );

  @override
  BoxShadow get thickTextShadow => const BoxShadow(
        offset: Offset(4, 4),
        blurRadius: 5,
        color: Color.fromARGB(255, 227, 227, 227),
      );

  @override
  BoxShadow get defaultShadow => const BoxShadow(
        offset: Offset(5, 5),
        blurRadius: 10,
        color: Color.fromARGB(255, 69, 69, 69),
      );

  @override
  BoxShadow get textShadow => const BoxShadow(
        offset: Offset(4, 4),
        blurRadius: 5,
        color: Color.fromARGB(255, 227, 227, 227),
      );

  @override
  BoxShadow get buttonShadowSmall => const BoxShadow(
        offset: Offset(4, 4),
        blurRadius: 5,
        color: Color.fromARGB(255, 227, 227, 227),
      );
}
