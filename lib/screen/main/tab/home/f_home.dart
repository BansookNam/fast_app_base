import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({
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
              child: const Text(
                '안녕하세요.',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ).centered()),
        ),
      ],
    );
  }
}
