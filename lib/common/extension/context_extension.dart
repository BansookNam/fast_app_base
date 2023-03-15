import 'package:fast_app_base/common/theme/custom_theme.dart';
import 'package:fast_app_base/common/theme/custom_theme_holder.dart';
import 'package:flutter/material.dart';

import '../common.dart';

extension ContextExtension on BuildContext {
  double width(double widthSize) {
    return MediaQuery.of(this).size.width * widthSize;
  }

  double height(double heightSize) {
    return MediaQuery.of(this).size.height * heightSize;
  }

  double get deviceWidth {
    return MediaQuery.of(this).size.width;
  }

  double get deviceHeight {
    return MediaQuery.of(this).size.height;
  }

  Orientation get deviceOrientation {
    return MediaQuery.of(this).orientation;
  }

  double get statusBarHeight {
    return MediaQuery.of(this).padding.top;
  }

  double get viewPaddingBottom {
    return MediaQuery.of(this).padding.bottom;
  }

  Brightness get platformBrightness {
    return MediaQuery.of(this).platformBrightness;
  }

  AbstractThemeColors get appColors => CustomThemeHolder.of(this).appColors;

  AbsThemeShadows get appShadows => CustomThemeHolder.of(this).appShadows;

  CustomTheme get themeType => CustomThemeHolder.of(this).theme;

  Function(CustomTheme) get changeTheme => CustomThemeHolder.of(this).changeTheme;
}
