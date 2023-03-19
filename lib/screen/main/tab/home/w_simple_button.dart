import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final String buttonText;
  final AxisDirection? arrowDirection;

  const SimpleButton(
    this.buttonText, {
    Key? key,
    this.arrowDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          buttonText.text.bold.make(),
          emptyExpanded,
          Arrow(
            direction: arrowDirection,
          ),
        ],
      ),
    );
  }
}
