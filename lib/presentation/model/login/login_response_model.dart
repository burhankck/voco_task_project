import 'package:voco_task_project/domain/services/network_manager/base_result_model.dart';
import 'package:voco_task_project/domain/services/network_manager/reflector.dart';
import 'package:voco_task_project/presentation/model/login/login_response.dart';

@reflector
class LoginResponseModel implements BaseResultModel, LoginModel {
  String token;

  LoginResponseModel({
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
