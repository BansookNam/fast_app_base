import 'package:fast_app_base/data/vo/vo_bank_account.dart';
import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import 'w_send_button.dart';

class AccountItem extends StatelessWidget {
  final BankAccount bankAccount;

  const AccountItem(this.bankAccount, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(bankAccount.bank.logo, width: 40),
          width5,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (bankAccount.accountTypeName ?? bankAccount.bank.name)
                  .text
                  .size(10)
                  .color(context.appColors.dimmedText)
                  .make(),
              (bankAccount.balance.toComma()).text.make(),
            ],
          ),
          emptyExpanded,
          const SendButton(),
        ],
      ),
    );
  }
}
