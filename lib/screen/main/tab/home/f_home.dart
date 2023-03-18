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
        const Height(4),
        tossbankButton,
        const Height(4),
        investment,
        const Height(4),
        etcHorizontal,
        const Height(10),
        extraButtons,
        privacyPolicy,
      ],
    );
  }
}
