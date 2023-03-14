import 'local_db_error_type.dart';

export 'local_db_error_type.dart';

class LocalDBError {
  LocalDBErrorType localDBErrorType;
  String message;

  LocalDBError(
    this.localDBErrorType,
    this.message,
  );
}
