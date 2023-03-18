import 'package:fast_app_base/common/common.dart';

import '../../../../data/vo/vo_bank.dart';

final basicBanks = <Bank>[
  bankShinhan,
  bankKakao,
  bankToss,
];

final bankShinhan = Bank('신한은행', '$basePath/bank/bank_shinhan.png');
final bankKakao = Bank('카카오뱅크', '$basePath/bank/bank_kakao.png');
final bankToss = Bank('토스뱅크', '$basePath/bank/bank_toss.png');
