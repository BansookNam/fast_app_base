import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class AllFragment extends StatelessWidget {
  const AllFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Tap(
              onTap: () {
                Scaffold.of(context).openDrawer();
                //Nav.push(const FavoriteFragment(), context: context);
              },
              child: '전체'.text.make().centered()),
        ),
      ],
    );
  }
}
