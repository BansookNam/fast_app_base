// import 'package:flutter/foundation.dart';
// import 'package:isar/isar.dart';

//
// import '../../data/local/error/local_db_error.dart';
// import '../network/result/simple_result.dart';

class LocalDB {
  //static late final Isar _isar;

// static Future<void> init() async {
//   _isar = await Isar.open([LocalDocumentSchema], maxSizeMiB: 512);
// }
//
// static Future<Result<List<LocalDocument>, String>> getDocuments() async {
//   try {
//     debugPrint('get response success');
//     final documents = await _isar.localDocuments.filter().idGreaterThan(0).findAll();
//     return Result.success(documents);
//   } catch (e) {
//     debugPrint('get response fail');
//     return Result.failure(e.toString());
//   }
// }
//
// static Future<Result<void, LocalDBError>> addDocument(Document document) async {
//   final documents = await _isar.localDocuments.filter().imageUrlMatches(document.imageUrl).findAll();
//   if (documents.isNotEmpty) {
//     debugPrint('already exist');
//     return Result.failure(LocalDBError(LocalDBErrorType.alreadyExist, 'Document is already exist'));
//   }
//
//   final localDocument = document.toLocalDocument();
//   await _isar.writeTxn(() async {
//     await _isar.localDocuments.put(localDocument);
//   });
//   return Result.success();
// }
//
// static Future<Result<void, LocalDBError>> removeDocument(ImageUrlProvider document) async {
//   final documents = await _isar.localDocuments.filter().imageUrlMatches(document.imageUrl).findAll();
//   if (documents.isEmpty) {
//     debugPrint('Not exist');
//     return Result.failure(LocalDBError(LocalDBErrorType.notExist, 'Document is not exist'));
//   }
//   await _isar.writeTxn(() async {
//     await _isar.localDocuments.delete(documents[0].id);
//   });
//   return Result.success();
// }
}
