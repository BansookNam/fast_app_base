import 'package:fast_app_base/data/vo/vo_bank_account.dart';
import 'package:fast_app_base/screen/main/tab/home/dummy_bank_list.dart';

final myAccounts = <BankAccount>[
  bankAccountToss1,
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountKakao1,
];

final bankAccountShinhan1 = BankAccount(
  bankShinhan,
  '123-123-123',
  '홍길동',
  40000,
  accountTypeName: '주거래 우대통장(저축예금)',
);
final bankAccountShinhan2 = BankAccount(
  bankShinhan,
  '123-123-1234',
  '홍길동',
  5000,
  accountTypeName: '저축예금',
);
final bankAccountKakao1 = BankAccount(
  bankKakao,
  '123-123-1234',
  '홍길동',
  5000,
  accountTypeName: '입출금통장',
);
final bankAccountToss1 = BankAccount(
  bankToss,
  '123-123-1234',
  '홍길동',
  5000,
  accountTypeName: '저축예금',
);
