// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:voco_task_project/data/resources/api_constant/api_constant.dart';
import 'package:voco_task_project/domain/services/network_manager/network_api_service.dart';
import 'package:voco_task_project/presentation/model/user_list/user_list_response_model.dart';

class UserListService {
  Future<UserListResponseModel?> getUserListService() async {
    try {
      dynamic response = await NetworkApiServices.instance
          .getApiResponse<UserListResponseModel>(
        ApiConstant.baseUrl,
        ApiConstant.userListEndPoint,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
