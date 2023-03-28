import 'package:flutter/material.dart';

import '../../common.dart';

extension SnackbarContextExtension on BuildContext {
  ///Scaffold안에 Snackbar를 보여줍니다.
  void showSnackbar(String message) {
    _showSnackBarWithContext(
      this,
      _SnackbarFactory.createSnackBar(this, message),
    );
  }

  ///Scaffold안에 빨간 Snackbar를 보여줍니다.
  void showErrorSnackbar(
    String message, {
    Color bgColor = AppColors.salmon,
    double bottomMargin = 0,
  }) {
    _showSnackBarWithContext(
      this,
      _SnackbarFactory.createErrorSnackBar(
        this,
        message,
        bgColor: bgColor,
        bottomMargin: bottomMargin,
      ),
    );
  }
}

void _showSnackBarWithContext(BuildContext context, SnackBar snackbar) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

class _SnackbarFactory {
  static SnackBar createSnackBar(BuildContext context, String message,
      {Color bgColor = AppColors.brightBlue}) {
    return SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Colors.transparent,
        content: GestureDetector(
          onTap: () {
            try {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            } catch (e) {
              //do nothing
            }
          },
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Center(
                  child: Container(
                      width: context.deviceWidth - 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
                      decoration:
                          BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(message,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                            )),
                      )),
                ),
              ],
            ),
          ),
        ));
  }

  static SnackBar createErrorSnackBar(BuildContext context, String? message,
      {Color bgColor = AppColors.salmon, double bottomMargin = 0}) {
    return SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Colors.transparent,
        content: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          child: Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(bottom: bottomMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Center(
                  child: Container(
                      width: context.deviceWidth - 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
                      decoration:
                          BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text("$message",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                            )),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
