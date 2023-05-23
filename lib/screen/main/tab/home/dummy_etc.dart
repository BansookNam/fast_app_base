import 'package:fast_app_base/common/common.dart';

import '../../../../data/vo/vo_etc_item.dart';

final etcItems = <EtcItem>[
  carInsurance,
  todaysTip,
  creditScore,
];

final carInsurance = EtcItem('차 보험료\n조회', '혜택 주는', '$basePath/illustration/car.png');
final todaysTip = EtcItem('오늘의\n머니 팁', '최근', '$basePath/illustration/bulb.png');
final creditScore = EtcItem('신용점수\n보기', '자주', '$basePath/illustration/credit_score.png');
