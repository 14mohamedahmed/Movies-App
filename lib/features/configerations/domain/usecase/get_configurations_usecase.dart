import 'package:dartz/dartz.dart';
import 'package:movies_app/core/network/models/api_error_model.dart';
import 'package:movies_app/features/configerations/domain/enitiies/image_configs.dart';
import 'package:movies_app/features/configerations/domain/repository/configerations_repository.dart';

class GetConfigurationUsecase {
  final ConfigerationsRepository _configerationsRepository;
  GetConfigurationUsecase(this._configerationsRepository);

  Future<Either<ApiFaliureModel, ImageConfigs>> call() async {
    return await _configerationsRepository.getConfiguration();
  }
}
