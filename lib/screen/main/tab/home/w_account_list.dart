import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import 'dummy_bank_account_list.dart';
import 'w_account_item.dart';

class AccountList extends StatefulWidget {
  const AccountList({Key? key}) : super(key: key);

  @override
  State<AccountList> createState() => _AccountListState();
}

class _AccountListState extends State<AccountList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height20,
        ...myAccounts.map((e) => AccountItem(e)).toList(),
      ],
    );
  }
}
