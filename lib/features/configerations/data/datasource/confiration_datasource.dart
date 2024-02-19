import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/exception/server_exception.dart';
import 'package:movies_app/core/network/network_provider/api_services.dart';
import 'package:movies_app/features/configerations/data/models/image_configs_model.dart';

abstract class ConfigerationsDatasource {
  Future<ImageConfigsModel> getConfiguration();
}

class ConfigerationsDatasourceImpl extends ConfigerationsDatasource {
  final ApiService _apiService;
  ConfigerationsDatasourceImpl(this._apiService);

  @override
  Future<ImageConfigsModel> getConfiguration() async {
    final response = await _apiService.get(ApiConstants.configuration);
    return response.fold(
      (l) {
        throw ServerException(errorModel: l);
      },
      (r) {
        return ImageConfigsModel.fromJson(r.data['images']);
      },
    );
  }
}
