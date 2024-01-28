import 'package:voco_task_project/domain/services/network_manager/base_result_model.dart';

abstract class BaseApiService {
  Future<dynamic> getApiResponse<T extends BaseResultModel>(
      String baseAdress, String path);

  Future<dynamic> postApiResponse<T extends BaseResultModel>(
      String baseAdress, String path, dynamic data);
}
