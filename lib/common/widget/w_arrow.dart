import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  final AnimationController controller;

  const Arrow(
      this.controller, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: AnimatedIcon(progress: controller, icon: AnimatedIcons.arrow_menu),
    );
  }
}
