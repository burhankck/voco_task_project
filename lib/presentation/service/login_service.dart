// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:voco_task_project/data/resources/api_constant/api_constant.dart';
import 'package:voco_task_project/domain/services/network_manager/network_api_service.dart';
import 'package:voco_task_project/presentation/model/login/login_request_model.dart';
import 'package:voco_task_project/presentation/model/login/login_response_model.dart';

class LoginService {
  Future<LoginResponseModel?> userAuthService(
      {required LoginRequestModel loginRequestModel, required int page}) async {
    try {
      dynamic response =
          await NetworkApiServices.instance.postApiResponse<LoginResponseModel>(
        ApiConstant.baseUrl,
        ApiConstant.userAuthEndPoint,
        loginRequestModel.toJson(),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}