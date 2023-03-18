import 'package:fast_app_base/data/simple_result.dart';
import 'package:flutter/material.dart';
import 'package:nav/bottom_sheet/modal_bottom_sheet.dart';

import '../../common/common.dart';

class ColorBottomSheet extends ModalBottomSheet<SimpleResult> {
  final String message;
  final Color textColor;

  ColorBottomSheet(
    this.message, {
    Color? textColor,
    super.context,
    super.key,
    super.backgroundColor = Colors.purple,
    super.handleColor = Colors.red,
    super.barrierColor = const Color(0x80000000),
  }) : textColor = textColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () => hide(SimpleResult()),
      child: SizedBox(
        height: 230,
        width: double.infinity,
        child: Center(
          child: Text(
            message,
            style: TextStyle(
              fontSize: 30,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
