// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ImageConfigs extends Equatable {
  final String baseUrl;
  final String secureBaseUrl;
  final List<String> backdropSizes;
  final List<String> posterSizes;

  const ImageConfigs({
    required this.baseUrl,
    required this.secureBaseUrl,
    required this.backdropSizes,
    required this.posterSizes,
  });

  ImageConfigs copyWith({
    String? baseUrl,
    String? secureBaseUrl,
    List<String>? backdropSizes,
    List<String>? posterSizes,
  }) =>
      ImageConfigs(
        baseUrl: baseUrl ?? this.baseUrl,
        secureBaseUrl: secureBaseUrl ?? this.secureBaseUrl,
        backdropSizes: backdropSizes ?? this.backdropSizes,
        posterSizes: posterSizes ?? this.posterSizes,
      );

  @override
  List<Object> get props =>
      [baseUrl, secureBaseUrl, backdropSizes, posterSizes];
}
