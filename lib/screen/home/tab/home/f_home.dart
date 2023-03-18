import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/dialog/d_green.dart';
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
                // final result = await MessageDialog(context, "안녕하세요").show();
                // debugPrint(result.toString());

                final confirmDialogResult = await ConfirmDialog(
                  '오늘 기분이 좋나요?',
                  buttonText: "네",
                  cancelButtonText: "아니오",
                ).show();
                debugPrint(confirmDialogResult?.isSuccess.toString());

                confirmDialogResult?.runIfSuccess((data) {
                  GreenBottomSheet('❤️', context: context).show();
                });

                confirmDialogResult?.runIfFailure((data) {
                  GreenBottomSheet('❤️힘내여').show();
                });
              },
              child: '홈'.text.make().centered()),
        ),
      ],
    );
  }
}
