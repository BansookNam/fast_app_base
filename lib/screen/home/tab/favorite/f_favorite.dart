import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/home/tab/home/f_home.dart';
import 'package:flutter/material.dart';

class FavoriteFragment extends StatelessWidget {
  final bool isShowCloseButton;

  const FavoriteFragment({
    Key? key,
    this.isShowCloseButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(isShowCloseButton) const CloseButton(),
        Expanded(
          child: Tap(
              onTap: () {
                Nav.push(const HomeFragment(), context: context);
              },
              child: '즐겨찾기'.text.make().centered()),
        ),
      ],
    );
  }
}
