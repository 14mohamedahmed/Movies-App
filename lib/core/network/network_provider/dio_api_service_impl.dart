import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/interceptors/dio_interceptor.dart';
import 'package:movies_app/core/network/models/api_error_model.dart';
import 'package:movies_app/core/network/models/api_success_model.dart';
import 'package:movies_app/core/network/network_provider/api_services.dart';

class DioApiServiceImpl extends ApiService {
  DioApiServiceImpl() {
    _dio.interceptors.add(DioInterceptor());
    _dio.options.validateStatus = (status) {
      return true;
    };
  }
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  @override
  Future<Either<ApiFaliureModel, ApiSuccessModel>> get(
    String path, {
    Map<String, dynamic> queryParameters = const {},
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      return Right(ApiSuccessModel(
        statusCode: response.statusCode!,
        // here, we should to pass the response message to display it for the user if needed
        message: response.statusMessage!,
        // return API data with generic type
        data: response.data,
      ));
    } on DioException catch (error) {
      return Left(ApiFaliureModel.fromJson(error.response?.data ?? {}));
    }
  }
}
