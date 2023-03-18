import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  final Widget child;

  const RoundContainer(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: context.appColors.layerBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
