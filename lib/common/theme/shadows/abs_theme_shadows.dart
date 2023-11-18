import 'package:flutter/material.dart';

abstract class AbsThemeShadows {
  const AbsThemeShadows();

  BoxShadow get buttonShadow;

  BoxShadow get buttonShadowSmall;

  BoxShadow get textShadow;

  BoxShadow get defaultShadow;

  BoxShadow get thickTextShadow;
}
