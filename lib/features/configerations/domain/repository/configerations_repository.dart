import 'package:dartz/dartz.dart';
import 'package:movies_app/core/network/models/api_error_model.dart';
import 'package:movies_app/features/configerations/domain/enitiies/image_configs.dart';

abstract class ConfigerationsRepository {
  Future<Either<ApiFaliureModel, ImageConfigs>> getConfiguration();
}
