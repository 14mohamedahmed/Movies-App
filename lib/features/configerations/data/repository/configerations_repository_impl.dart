import 'package:dartz/dartz.dart';
import 'package:movies_app/core/network/exception/server_exception.dart';
import 'package:movies_app/core/network/models/api_error_model.dart';
import 'package:movies_app/features/configerations/data/datasource/confiration_datasource.dart';
import 'package:movies_app/features/configerations/domain/enitiies/image_configs.dart';
import 'package:movies_app/features/configerations/domain/repository/configerations_repository.dart';

class ConfigerationsRepositoryImpl extends ConfigerationsRepository {
  final ConfigerationsDatasource _configerationsDatasource;

  ConfigerationsRepositoryImpl(this._configerationsDatasource);

  @override
  Future<Either<ApiFaliureModel, ImageConfigs>> getConfiguration() async {
    try {
      final result = await _configerationsDatasource.getConfiguration();
      return Right(result);
    } on ServerException catch (faliure) {
      return Left(faliure.errorModel);
    }
  }
}
