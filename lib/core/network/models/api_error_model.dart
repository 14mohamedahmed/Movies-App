import 'package:equatable/equatable.dart';

class ApiErrorModel extends Equatable {
  final bool success;
  final int statusCode;
  final String statusMessage;

  const ApiErrorModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  // this format is provided from API documentation and can be changed
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
      );

  @override
  List<Object> get props => [success, statusCode, statusMessage];
}
