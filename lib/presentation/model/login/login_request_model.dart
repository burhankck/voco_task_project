
import 'package:voco_task_project/domain/services/network_manager/base_result_model.dart';
import 'package:voco_task_project/domain/services/network_manager/reflector.dart';
import 'package:voco_task_project/presentation/model/login/login_response.dart';

@reflector
class LoginRequestModel implements BaseResultModel, LoginModel{
    String email;
    String password;

    LoginRequestModel({
        required this.email,
        required this.password,
    });

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
