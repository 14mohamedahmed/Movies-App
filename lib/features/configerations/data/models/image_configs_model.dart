import 'package:movies_app/features/configerations/domain/enitiies/image_configs.dart';

class ImageConfigsModel extends ImageConfigs {
  const ImageConfigsModel(
      {required super.baseUrl,
      required super.secureBaseUrl,
      required super.backdropSizes,
      required super.posterSizes});

  factory ImageConfigsModel.fromJson(Map<String, dynamic> json) =>
      ImageConfigsModel(
        baseUrl: json["base_url"],
        secureBaseUrl: json["secure_base_url"],
        backdropSizes: List<String>.from(json["backdrop_sizes"].map((x) => x)),
        posterSizes: List<String>.from(json["poster_sizes"].map((x) => x)),
      );
}
