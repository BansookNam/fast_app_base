import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class StockFragment extends StatelessWidget {
  const StockFragment({
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
              child: '주식'.text.make().centered()),
        ),
      ],
    );
  }
}
