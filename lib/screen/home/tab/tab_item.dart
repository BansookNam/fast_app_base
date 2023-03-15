import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class TabItem {
  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final navigationKey =  GlobalKey<NavigatorState>();

  TabItem._(this.activeIcon, this.inActiveIcon, this.tabName);

  static final TabItem home = TabItem._(Icons.home, Icons.home_outlined, '홈');
  static final TabItem favorite = TabItem._(Icons.star, Icons.star_border_outlined, '즐겨찾기');

  BottomNavigationBarItem toNavigationBarItem(BuildContext context, {required bool isActivated}) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(tabName),
          isActivated ? activeIcon : inActiveIcon,
          color:
              isActivated ? context.appColors.iconButton : context.appColors.iconButtonInactivate,
        ),
        label: tabName);
  }
}
