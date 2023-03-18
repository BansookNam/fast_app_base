import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      backgroundColor: const Color.fromRGBO(44, 44, 52, 1.0),
      padding: 10,
      child: '송금'.text.make(),
    );
  }
}
