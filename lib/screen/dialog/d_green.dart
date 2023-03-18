import 'package:fast_app_base/data/simple_result.dart';
import 'package:flutter/material.dart';
import 'package:nav/bottom_sheet/modal_bottom_sheet.dart';

import '../../common/common.dart';

class GreenBottomSheet extends ModalBottomSheet<SimpleResult> {
  final String message;

  GreenBottomSheet(
    this.message, {
    super.context,
    super.key,
    super.backgroundColor = Colors.purple,
    super.handleColor = Colors.red,
    super.barrierColor = const Color(0x80000000),
  });

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () => hide(SimpleResult()),
      child: Container(
        height: 230,
        width: double.infinity,
        color: Colors.green,
        child: Center(
          child: Text(
            message,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
