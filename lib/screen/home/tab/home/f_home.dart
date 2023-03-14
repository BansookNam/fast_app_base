import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tap(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: 'Home'.text.make().centered());
  }
}
