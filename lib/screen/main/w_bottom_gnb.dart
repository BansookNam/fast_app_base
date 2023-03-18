import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/tab_item.dart';
import 'package:flutter/material.dart';

class BottomGnb extends StatelessWidget {
  final double bottomNavigationBarBorderRadius;
  final List<TabItem> tabs;
  final int currentIndex;
  final ValueChanged<int> handleOnTapNavigationBarItem;

  const BottomGnb({
    Key? key,
    required this.bottomNavigationBarBorderRadius,
    required this.tabs,
    required this.currentIndex,
    required this.handleOnTapNavigationBarItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bottomNavigationBarBorderRadius),
          topRight: Radius.circular(bottomNavigationBarBorderRadius),
        ),
        child: BottomNavigationBar(
          backgroundColor: context.appColors.layerBackground,
          items: navigationBarItems(context),
          currentIndex: currentIndex,
          selectedItemColor: context.appColors.text,
          unselectedItemColor: context.appColors.iconButtonInactivate,
          onTap: handleOnTapNavigationBarItem,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> navigationBarItems(BuildContext context) {
    return tabs
        .mapIndexed(
          (tab, index) => tab.toNavigationBarItem(
            context,
            isActivated: currentIndex == index,
          ),
        )
        .toList();
  }
}
