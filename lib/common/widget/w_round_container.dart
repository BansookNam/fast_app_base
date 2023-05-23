import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class RoundSquareContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double sideMargin;
  final EdgeInsets padding;
  final double borderRadius;
  final Color? backgroundColor;

  const RoundSquareContainer({
    required this.child,
    this.height,
    this.width,
    this.sideMargin = 15,
    this.borderRadius = 15,
    this.backgroundColor,
    EdgeInsets? padding,
    Key? key,
  })  : padding = padding ?? const EdgeInsets.all(15),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: EdgeInsets.symmetric(horizontal: sideMargin),
      decoration: BoxDecoration(
        color: backgroundColor ?? context.appColors.layerBackground,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
