import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class RoundSquareContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double sideMargin;
  final double padding;
  final double borderRadius;
  final Color? backgroundColor;

  const RoundSquareContainer({
    required this.child,
    this.height,
    this.sideMargin = 15,
    this.padding = 20,
    this.borderRadius = 15,
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
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
