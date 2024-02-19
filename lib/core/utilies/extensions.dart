import 'package:intl/intl.dart';
import 'package:movies_app/features/configerations/domain/enitiies/image_configs.dart';

extension ImageConfigsExtension on ImageConfigs {
  /// be default return first size from the list
  String? getBaseUrlWithBackdropSize([int index = 0]) {
    if (backdropSizes.contains(backdropSizes[index])) {
      final firstBackdropSize = backdropSizes[index];
      return '$baseUrl/$firstBackdropSize';
    }
    return '$baseUrl/${backdropSizes.last}';
  }

  /// be default return first size from the list
  String? getBaseUrlWithPostersSize([int index = 0]) {
    if (posterSizes.contains(posterSizes[index])) {
      final firstPosterSize = posterSizes[index];
      return '$baseUrl/$firstPosterSize';
    }
    return '$baseUrl/${posterSizes.last}';
  }
}

extension DateTimeFormat on DateTime {
  convertToHumanRead() {
    return DateFormat("EEEE, dd MMM yyyy").format(this);
  }
}
