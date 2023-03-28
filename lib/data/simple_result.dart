import 'dart:async';

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

  SimpleResult runIfSuccess(FutureOr<void> Function(SuccessType data) function) {
    _runSuccess(function);
    return this;
  }

  SimpleResult runIfFailure(FutureOr<void> Function(FailureType error) function) {
    _runFailure(function);
    return this;
  }

  FutureOr<SimpleResult> runIfSuccessAsync(
      FutureOr<void> Function(SuccessType data) function) async {
    await _runSuccess(function);
    return this;
  }


  FutureOr<SimpleResult> runIfFailureAsync(
      FutureOr<void> Function(FailureType error) function) async {
    await _runFailure(function);
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

  Future<void> _runSuccess(FutureOr<void> Function(SuccessType data) function) async {
    if (isSuccess) {
      if (!_isSuccessDataExist) {
        await function(null as SuccessType);
      } else {
        await function(successData);
      }
    }
  }


  Future<void> _runFailure(FutureOr<void> Function(FailureType error) function) async {
    if (isFailure) {
      if (!_isFailureDataExist) {
        await function(null as FailureType);
      } else {
        await function(failureData);
      }
    }
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
