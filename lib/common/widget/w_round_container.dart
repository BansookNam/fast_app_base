import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double sideMargin;

  const RoundContainer({
    required this.child,
    this.height,
    this.sideMargin = 15,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: sideMargin),
      decoration: BoxDecoration(
        color: context.appColors.layerBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
