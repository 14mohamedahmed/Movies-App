import 'package:equatable/equatable.dart';

class ApiFaliureModel extends Equatable {
  final bool success;
  final int statusCode;
  final String statusMessage;

  const ApiFaliureModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  // this format is provided from API documentation and can be changed
  factory ApiFaliureModel.fromJson(Map<String, dynamic> json) =>
      ApiFaliureModel(
        success: json["success"] ?? false,
        statusCode: json["status_code"] ?? 0,
        statusMessage: json["status_message"] ?? "",
      );

  @override
  List<Object> get props => [success, statusCode, statusMessage];
}
