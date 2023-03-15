import 'package:fast_app_base/screen/home/tab/favorite/f_favorite.dart';
import 'package:fast_app_base/screen/home/tab/home/f_home.dart';
import 'package:fast_app_base/screen/home/tab/tab_item.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';
import 'w_menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final tabs = [TabItem.home, TabItem.favorite];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      drawer: const MenuDrawer(),
      body: SafeArea(
        child: IndexedStack(
            index: _currentIndex, children: const [HomeFragment(), FavoriteFragment()]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: navigationBarItems(context),
        currentIndex: _currentIndex,
        selectedItemColor: context.appColors.text,
        unselectedItemColor: context.appColors.iconButtonInactivate,
        onTap: _handleTapTab,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  List<BottomNavigationBarItem> navigationBarItems(BuildContext context) {
    return tabs
        .mapIndexed(
          (tab, index) => tab.toNavigationBarItem(
            context,
            isActivated: _currentIndex == index,
          ),
        )
        .toList();
  }

  void _handleTapTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomNavigationBarItem bottomItem(
      bool activate, IconData iconData, IconData inActivateIconData, String label) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(label),
          activate ? iconData : inActivateIconData,
          color: activate ? context.appColors.iconButton : context.appColors.iconButtonInactivate,
        ),
        label: label);
  }
}
