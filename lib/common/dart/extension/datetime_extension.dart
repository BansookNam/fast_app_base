

import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String get formattedDate => DateFormat('dd/MM/yyyy').format(this);

  String get formattedTime => DateFormat('HH:mm').format(this);

  String get formattedDateTime => DateFormat('dd/MM/yyyy HH:mm').format(this);
}
