class SimpleResult<SuccessType, FailureType> {
  bool get isFailure => this is _Failure<SuccessType, FailureType>;

  bool get isSuccess => this is _Success<SuccessType, FailureType>;

  FailureType get failureData {
    if (isFailure) {
      final data = (this as _Failure<SuccessType, FailureType>).data;
      if (data == null) {
        throw const FormatException('Failure data not exist');
      }
      return data;
    }

    throw const FormatException('This is not Failure type');
  }

  SuccessType get successData {
    if (isSuccess) {
      final data = (this as _Success<SuccessType, FailureType>).data;
      if (data == null) {
        throw const FormatException('Success data not exist');
      }
      return data;
    }

    throw const FormatException('This is not Success type');
  }

  SimpleResult runIfSuccess(void Function(SuccessType data) function) {
    if (isSuccess) {
      if (!_isSuccessDataExist) {
        function(null as SuccessType);
      } else {
        function(successData);
      }
    }
    return this;
  }

  SimpleResult runIfFailure(void Function(FailureType error) function) {
    if (isFailure) {
      if (!_isFailureDataExist) {
        function(null as FailureType);
      } else {
        function(failureData);
      }
    }
    return this;
  }

  bool get _isSuccessDataExist {
    if ((this as _Success<SuccessType, FailureType>).data == null) {
      return false;
    }
    return true;
  }

  bool get _isFailureDataExist {
    if ((this as _Failure<SuccessType, FailureType>).data == null) {
      return false;
    }
    return true;
  }

  // ignore: library_private_types_in_public_api
  static _Failure<SuccessType, FailureType> failure<SuccessType, FailureType>([FailureType? data]) {
    return _Failure<SuccessType, FailureType>(data);
  }

  // ignore: library_private_types_in_public_api
  static _Success<SuccessType, FailureType> success<SuccessType, FailureType>([SuccessType? data]) {
    return _Success<SuccessType, FailureType>(data);
  }
}

class _Success<SuccessType, FailureType> extends SimpleResult<SuccessType, FailureType> {
  final SuccessType? data;

  _Success(this.data);
}

class _Failure<SuccessType, FailureType> extends SimpleResult<SuccessType, FailureType> {
  final FailureType? data;

  _Failure(this.data);
}
