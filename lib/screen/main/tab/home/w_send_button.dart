import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RoundSquareButton('송금');
  }
}
