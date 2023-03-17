import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
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
          child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onLongPress: () {
                Scaffold.of(context).openDrawer();
              },
              onTap: () async {
                //Nav.push(const HomeFragment(), context: context);
                final result = await MessageDialog(context, "안녕하세요").show();
                debugPrint(result.toString());
              },
              child: '홈'.text.make().centered()),
        ),
      ],
    );
  }
}
