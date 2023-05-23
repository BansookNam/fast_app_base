import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/round_button_theme.dart';
import 'package:flutter/material.dart';

import 'mixin/wm_refresh_every_second.dart';

class RoundButton extends StatefulWidget {
  final String text;
  final bool isEnabled;
  final Function() onTap;
  final Function()? onTapDisabled;
  final double? width;
  final double height;
  final double? borderRadius;
  final double fontSize;
  final double sidePadding;
  final double rightPadding;
  final double leftPadding;
  final double leftWidgetLeftPadding;
  final double sideMargin;
  final bool isFullWidth;
  final bool wrapContent;
  final RoundButtonTheme? theme;
  final Widget? leftWidget;
  final bool leftWidgetOnStack;
  final Widget? rightWidget;
  final TextAlign textAlign;

  final Color shadowColor;
  final Color borderColor;
  final Color bgColor;
  final Color textColor;
  final FontWeight fontWeight;

  RoundButton(
      {required this.text,
      this.isEnabled = true,
      required this.onTap,
      this.onTapDisabled,
      this.width,
      this.height = 50.0,
      this.borderRadius,
      this.isFullWidth = false,
      this.wrapContent = true,
      this.theme,
      Color? shadowColor,
      Color? textColor,
      Color? bgColor,
      Color? borderColor,
      this.fontWeight = FontWeight.w500,
      this.fontSize = 16,
      this.sidePadding = 15.0,
      this.rightPadding = 0.0,
      this.leftPadding = 0.0,
      this.leftWidgetLeftPadding = 18.0,
      this.leftWidgetOnStack = true,
      this.sideMargin = 0.0,
      this.leftWidget,
      this.rightWidget,
      this.textAlign = TextAlign.start,
      Key? key})
      : shadowColor = shadowColor ?? theme?.shadowColor ?? Colors.transparent,
        textColor = textColor ?? theme?.textColor ?? Colors.white,
        bgColor = bgColor ?? theme?.bgColor ?? AppColors.blue,
        borderColor = borderColor ?? theme?.borderColor ?? Colors.transparent,
        super(key: key);

  @override
  RoundButtonState createState() => RoundButtonState();
}

class RoundButtonState extends State<RoundButton> with RefreshEverySecond {
  final Color disabledBgColor = AppColors.grey;
  final Color disabledTextColor = Colors.white;

  int colorIndex = 0;

  @override
  void initState() {
    refreshSecondfunction = () {
      colorIndex++;
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color = widget.isEnabled ? (widget.bgColor) : disabledBgColor;
    Color currentTextColor = widget.isEnabled ? widget.textColor : disabledTextColor;
    Color borderColor = widget.borderColor;
    Color shadowColor = widget.shadowColor;
    var finalWidth = widget.wrapContent ? null : widget.width;
    if (widget.isFullWidth) {
      finalWidth = context.deviceWidth - widget.sidePadding * 2;
    }

    if (widget.theme != null) {
      switch (widget.theme) {
        case RoundButtonTheme.blink:
          if (!isRefreshStarted) {
            startTimer();
          }
          break;
        default:
          if (isRefreshStarted) {
            stopTimer();
          }
          break;
      }

      switch (widget.theme) {
        case RoundButtonTheme.blink:
          final index = colorIndex % 2;
          color = index == 0 ? AppColors.green : AppColors.salmon;
          currentTextColor = Colors.white;
          borderColor = index == 0 ? AppColors.green : AppColors.salmon;
          shadowColor = Colors.transparent;
          break;
        default:
          break;
      }
    }

    if (!widget.isEnabled) {
      color = disabledBgColor;
      currentTextColor = disabledTextColor;
      borderColor = Colors.transparent;
    }

    return Tap(
      onTap: (widget.isEnabled) ? widget.onTap : widget.onTapDisabled ?? () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: widget.sideMargin),
            padding: EdgeInsets.only(
                left: widget.sidePadding + widget.leftPadding,
                right: widget.sidePadding + widget.rightPadding),
            duration: const Duration(milliseconds: 300),
            width: finalWidth,
            height: widget.height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(widget.height / 2),
              border: Border.all(width: 1, color: borderColor),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                    color: shadowColor, offset: const Offset(0, 3), blurRadius: 6, spreadRadius: 0)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.leftWidget != null && !widget.leftWidgetOnStack) widget.leftWidget!,
                Text(
                  widget.text,
                  textAlign: widget.textAlign,
                  style: TextStyle(
                    color: currentTextColor,
                    fontSize: widget.fontSize,
                    fontWeight: widget.fontWeight,
                  ),
                ),
              ],
            ),
          ),
          if (widget.leftWidget != null && widget.leftWidgetOnStack)
            Positioned.fill(
              left: widget.leftWidgetLeftPadding,
              child: Align(
                alignment: Alignment.centerLeft,
                child: widget.leftWidget,
              ),
            ),
          if (widget.rightWidget != null)
            Positioned.fill(
              left: 18,
              child: Container(
                alignment: Alignment.centerRight,
                child: widget.rightWidget,
              ),
            ),
        ],
      ),
    );
  }
}
