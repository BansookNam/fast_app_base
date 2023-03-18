import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        appBar,
        height4,
        tossbankButton,
        height4,
        investment,
        height4,
        etcHorizontal,
        height4,
        extraButtons,
        privacyPolicy,
      ],
    );
  }
}
