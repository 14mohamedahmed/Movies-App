import 'package:dio/dio.dart';
import 'package:movies_app/core/network/api_constants.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "accept": "application/json",
      "content-type": "application/json",
      "Authorization": "Bearer ${ApiConstants.authToken}"
    });
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      handler.next(response);
      return;
    }
    // if request not success, we can handle the global messages for all requests here or re-throw the error for specifc handling
    late String message;
    switch (response.statusCode) {
      case 401:
        message = "You are not authorized";
        break;
      case 404:
        message =
            "You do not have access to this feature. Please contact your system administrator to proceed";
        break;
      case 422:
        message = response.data['errors'];
        break;
      case 400:
      case 500:
      case 503:
        message =
            "We have been notified of this mistake and we are looking to fix it.";
        break;
      default:
        message = "An unknown error occurred";
        break;
    }
    handler.reject(DioException(
      requestOptions: response.requestOptions,
      response: response,
    ));
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    late String message;
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        message =
            "Connection timed out. Please check your internet connection.";
        break;
      case DioExceptionType.sendTimeout:
        message = "Sending request timed out. Please try again later.";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receiving response timed out. Please try again later.";
        break;
      case DioExceptionType.cancel:
        message = "Request has been canceled.";
        break;
      case DioExceptionType.badCertificate:
        message =
            "Invalid SSL certificate. Please contact with technical support.";
        break;
      case DioExceptionType.badResponse:
        message = "An error occurred. Please contact with technical support.";
        break;
      case DioExceptionType.connectionError:
        message =
            "Error establishing a connection. Please check your internet connection.";
        break;
      case DioExceptionType.unknown:
        message = "An unknown error occurred. Please try again later.";
        break;
      default:
        message = "An error occurred. Please try again later.";
    }
    handler.reject(err);
  }
}
