import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/home/tab/favorite/f_favorite.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  final bool isShowCloseButton;

  const HomeFragment({
    Key? key,
    this.isShowCloseButton = true,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(isShowCloseButton)const CloseButton(),
        Expanded(
          child: Tap(
              onTap: () {
                Scaffold.of(context).openDrawer();
                //Nav.push(const FavoriteFragment(), context: context);
              },
              child: '홈'.text.make().centered()),
        ),
      ],
    );
  }
}
