import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class FavoriteFragment extends StatelessWidget {
  final bool isShowBackButton;

  const FavoriteFragment({
    Key? key,
    this.isShowBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowBackButton) const BackButton(),
        Expanded(
          child: Tap(
              onTap: () {
                Nav.push(const FavoriteFragment(), context: context);
              },
              child: '즐겨찾기'.text.make().centered()),
        ),
      ],
    );
  }
}
