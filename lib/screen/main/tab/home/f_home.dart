import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/round_button_theme.dart';
import 'package:fast_app_base/common/widget/w_empty_expanded.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/w_bank_account.dart';
import 'package:fast_app_base/screen/main/tab/home/w_toss_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/w_big_button.dart';
import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 60),
            child: Column(
              children: [
                BigButton(
                  "토스뱅크",
                  onTap: () {
                    context.showSnackbar("토스뱅크를 눌렀어요.");
                  },
                ),
                height10,
                RoundedContainer(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "자산".text.bold.white.make(),
                    height5,
                    ...bankAccounts.map((e) => BankAccountWidget(e)).toList(),
                  ],
                )),
              ],
            ).pSymmetric(h: 20),
          ),
          const TossAppBar()
        ],
      ),
    );
  }
}
