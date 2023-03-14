import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final AnimationController controller;

  const MenuButton(
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: AnimatedIcon(progress: controller, icon: AnimatedIcons.menu_close),
    );
  }
}
