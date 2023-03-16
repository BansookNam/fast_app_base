import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/home/tab/favorite/f_favorite.dart';
import 'package:fast_app_base/screen/home/tab/home/f_home.dart';
import 'package:flutter/material.dart';

class TabItem {
  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final navigationKey = GlobalKey<NavigatorState>();
  final Widget Function(BuildContext) firstPageBuilder;

  TabItem._(this.activeIcon, this.tabName, this.firstPageBuilder, {IconData? inActiveIcon})
      : inActiveIcon = inActiveIcon ?? activeIcon;

  static final TabItem home = TabItem._(
    Icons.home,
    '홈',
    (context) => const HomeFragment(isShowCloseButton: false),
  );
  static final TabItem favorite = TabItem._(
    Icons.star,
    '즐겨찾기',
    (context) => const FavoriteFragment(isShowCloseButton: false),
  );

  BottomNavigationBarItem toNavigationBarItem(BuildContext context, {required bool isActivated}) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(tabName),
          isActivated ? activeIcon : inActiveIcon,
          color: isActivated ? context.appColors.iconButton : context.appColors.iconButtonInactivate,
        ),
        label: tabName);
  }
}
