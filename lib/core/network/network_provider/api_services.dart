import 'package:dartz/dartz.dart';
import 'package:movies_app/core/network/models/api_error_model.dart';
import 'package:movies_app/core/network/models/api_success_model.dart';

abstract class ApiService {
  Future<Either<ApiErrorModel, ApiSuccessModel>> get(
    String path, {
    Map<String, dynamic> queryParameters = const {},
  });

  // .... We can add other methods to call APIs like Post, Update, Delete....
}
