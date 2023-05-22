import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_text_field_with_delete.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/w_arrow.dart';

class SearchBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;

  const SearchBarWidget({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Tap(
                onTap: () {
                  Nav.pop(context);
                },
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  child: Arrow(
                    direction: AxisDirection.left,
                  ),
                )),
            Expanded(
              child: TextFieldWithDelete(
                textInputAction: TextInputAction.search,
                controller: controller,
                texthint: "'게임'을 검색해보세요",
                onEditingComplete: () {
                  print(controller.text);
                  //검색 버튼 눌렀을때 처리 //search
                },
              ).pOnly(top: 5),
            ),
            Tap(
                onTap: () {
                  //search
                },
                child: const Icon(Icons.search).pOnly(right: 15))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
