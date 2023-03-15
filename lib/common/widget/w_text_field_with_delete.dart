import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common.dart';

class TextFieldWithDelete extends StatefulWidget {
  final Widget? leftImage;
  final String? texthint;
  final FocusNode? focusNode;
  final bool obscureText;
  final double deleteRightPadding;
  final double errorMessageMarginTop;
  final double fontSize;
  final FontWeight fontWeight;
  final bool? autofocus;
  final bool hideUnderline;
  final bool enabled;
  final bool error;
  final String? errorMessage;
  final int? showMaxCount;
  final Function(String? errorMessage)? validatorCallback;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final Function()? onTapDelete;

  const TextFieldWithDelete(
      {Key? key,
      this.focusNode,
      required this.controller,
      this.obscureText = false,
      this.error = false,
      this.errorMessage,
      this.fontSize = 14,
      this.fontWeight = FontWeight.normal,
      this.textInputAction,
      this.deleteRightPadding = 0,
      this.errorMessageMarginTop = 0,
      this.hideUnderline = false,
      this.enabled = true,
      this.inputFormatters,
      this.texthint,
      this.keyboardType,
      this.onEditingComplete,
      this.validatorCallback,
      this.leftImage,
      this.onTapDelete,
      this.showMaxCount,
      this.autofocus})
      : super(key: key);

  @override
  TextFieldWithDeleteState createState() => TextFieldWithDeleteState();
}

class TextFieldWithDeleteState extends State<TextFieldWithDelete> {
  var error = false;
  String? errorMessage;
  var showDeleteButton = false;
  var isFocused = false;
  FocusNode? focusNode = FocusNode();

  @override
  void initState() {
    initVariables();
    initTextListener();
    super.initState();
  }

  void initVariables() {
    if (widget.focusNode != null) {
      focusNode = widget.focusNode;
    }
  }

  void initTextListener() {
    if (isNotBlank(widget.controller.text)) {
      showDeleteButton = true;
    }
    widget.controller.addListener(() {
      if (!mounted) {
        return;
      }
      var showDeleteButton = false;

      showDeleteButton = widget.controller.text.isNotEmpty ? true : false;

      setState(() {
        this.showDeleteButton = showDeleteButton;
      });
    });

    focusNode!.addListener(() {
      if (!mounted) {
        return;
      }
      setState(() {
        isFocused = focusNode!.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            widget.leftImage == null
                ? Container()
                : Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: widget.leftImage,
                    ),
                  ),
            TextField(
              autofocus: widget.autofocus ?? false,
              focusNode: focusNode,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              enabled: widget.enabled,
              obscureText: widget.obscureText,
              textInputAction: widget.textInputAction,
              inputFormatters: widget.inputFormatters,
              onEditingComplete: widget.onEditingComplete,
              style: TextStyle(fontSize: widget.fontSize, fontWeight: widget.fontWeight),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: widget.leftImage == null ? 0 : 30, top: 10, bottom: 14),
                hintText: widget.texthint,
                hintStyle: TextStyle(
                    fontSize: widget.fontSize,
                    fontWeight: widget.fontWeight,
                    color: context.appColors.hintText),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.appColors.focusedBorder, width: 8),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: showDeleteButton && isFocused
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Tap(
                              onTap: () {
                                widget.controller.clear();
                                widget.onTapDelete?.invoke();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: widget.deleteRightPadding),
                                child: SvgPicture.asset(
                                  '$basePath/icon/delete_x.svg',
                                  colorFilter: ui.ColorFilter.mode(
                                      context.appColors.iconButton, ui.BlendMode.srcIn),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container()),
            )
          ],
        ),
      ],
    );
  }
}
