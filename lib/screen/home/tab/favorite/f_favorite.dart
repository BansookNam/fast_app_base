import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class FavoriteFragment extends StatelessWidget {
  const FavoriteFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tap(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: 'Favorite'.text.make().centered());
  }
}
