import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class RoundSquareButton extends StatelessWidget {
  final String buttonText;

  const RoundSquareButton(this.buttonText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundSquareContainer(
      backgroundColor: const Color.fromRGBO(44, 44, 52, 1.0),
      padding: const EdgeInsets.all(7),
      borderRadius: 7,
      child: buttonText.text.make(),
    );
  }
}
