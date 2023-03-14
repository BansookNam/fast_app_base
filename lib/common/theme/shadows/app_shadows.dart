import 'package:fast_app_base/common/theme/custom_theme_holder.dart';
import 'package:flutter/material.dart';

import '../theme_data.dart';

abstract class AppShadows {
   BoxShadow get buttonShadow;
   BoxShadow get buttonShadowSmall;
   BoxShadow get textShadow;
   BoxShadow get defaultShadow;
   BoxShadow get thickTextShadow;
}
