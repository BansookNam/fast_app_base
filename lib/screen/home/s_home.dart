import 'package:fast_app_base/screen/home/tab/tab_item.dart';
import 'package:fast_app_base/screen/home/tab/tab_navigator.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import '../../common/common.dart';
import 'w_menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  TabItem _currentTab = TabItem.home;
  final tabs = [TabItem.home, TabItem.favorite];

  int get _currentIndex => tabs.indexOf(_currentTab);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await _currentTab.navigationKey.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.home) {
            _changeTab(tabs.indexOf(TabItem.home));
            return false;
          }
        }
        // maybePop 가능하면 나가지 않는다.
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        drawer: const MenuDrawer(),
        body: SafeArea(
          child: IndexedStack(
              index: _currentIndex,
              children: tabs
                  .map((tab) => Offstage(
                        offstage: _currentTab != tab,
                        child: TabNavigator(
                          navigatorKey: tab.navigationKey,
                          tabItem: tab,
                        ),
                      ))
                  .toList()),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: navigationBarItems(context),
      currentIndex: _currentIndex,
      selectedItemColor: context.appColors.text,
      unselectedItemColor: context.appColors.iconButtonInactivate,
      onTap: _handleOnTapNavigationBarItem,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        App.isForeground = true;
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        App.isForeground = false;
        break;
      case AppLifecycleState.detached:
        break;
    }
    super.didChangeAppLifecycleState(state);
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

  void _changeTab(int index) {
    setState(() {
      _currentTab = tabs[index];
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

  void _handleOnTapNavigationBarItem(int index) {
    final oldTab = _currentTab;
    final targetTab = tabs[index];
    if (oldTab == targetTab) {
      final navigationKey = _currentTab.navigationKey;
      () async {
        final bool canPop = navigationKey.currentState?.canPop() == true;
        if (canPop) {
          while (navigationKey.currentState?.canPop() == true) {
            navigationKey.currentState!.pop();
          }
        }
      }();
    }

    _changeTab(index);
  }
}
