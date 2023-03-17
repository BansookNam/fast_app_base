import 'package:fast_app_base/data/simple_result.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

import '../../common/common.dart';

class MessageDialog extends DialogWidget<SimpleResult> {
  final String? message;
  final String? buttonText;
  final bool cancelable;
  final TextAlign textAlign;
  final double fontSize;

  MessageDialog(
    BuildContext context,
    this.message, {
    super.key,
    this.buttonText,
    this.fontSize = 14,
    this.cancelable = true,
    this.textAlign = TextAlign.start,
  }) : super(context);

  @override
  State<StatefulWidget> createState() {
    return _MessageDialogState();
  }
}

class _MessageDialogState extends DialogState<MessageDialog> {
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(14);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Container(
              constraints: const BoxConstraints(maxHeight: 500),
              decoration: BoxDecoration(
                  color: context.appColors.drawerBg,
                  borderRadius: const BorderRadius.only(topLeft: radius, topRight: radius)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        widget.message!,
                        style: TextStyle(
                            fontSize: widget.fontSize, height: 1.8, color: context.appColors.text),
                        textAlign: widget.textAlign,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  )
                ],
              )),
          Line(color: context.appColors.divider),
          Row(
            children: <Widget>[
              Expanded(
                child: Tap(
                  onTap: () {
                    widget.hide(SimpleResult.success());
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          color: context.appColors.drawerBg,
                          borderRadius:
                              const BorderRadius.only(bottomLeft: radius, bottomRight: radius)),
                      child: Text(
                        widget.buttonText ?? 'close'.tr(),
                        style: TextStyle(
                          color: context.appColors.confirmText,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      )),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}
