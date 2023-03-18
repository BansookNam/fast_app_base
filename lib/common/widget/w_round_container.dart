import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double sideMargin;
  final double padding;
  final Color? backgroundColor;

  const RoundContainer({
    required this.child,
    this.height,
    this.sideMargin = 15,
    this.padding = 20,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      margin: EdgeInsets.symmetric(horizontal: sideMargin),
      decoration: BoxDecoration(
        color: backgroundColor ?? context.appColors.layerBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
