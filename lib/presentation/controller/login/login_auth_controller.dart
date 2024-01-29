import 'package:flutter/material.dart';
import 'package:voco_task_project/domain/services/network_manager/base_result_model.dart';
import 'package:voco_task_project/presentation/controller/login/login_token_cache_controller.dart';
import 'package:voco_task_project/presentation/model/login/login_request_model.dart';
import 'package:voco_task_project/presentation/model/login/login_response_model.dart';
import 'package:voco_task_project/presentation/service/login_service.dart';

class LoginAuthState extends ChangeNotifier
    with _ProviderConstant, TokenCacheManager {
  Future<void> userAuth({
    required String userEmail,
    required String password,
    required int page,
  }) async {
    _isLoadingChange();
    await _loginService
        .userAuthService(
      loginRequestModel: _createLoginReqModel(
        userEmail: userEmail,
        password: password,
      ),
      page: page,
    )
        .then((responseValue) {
      if (responseValue != null) {
        _isLoadingChange();
        loginRespModel = responseValue;
        saveToken(token: responseValue.token);
      }
    }).onError((error, stackTrace) {});
  }

  LoginRequestModel _createLoginReqModel({
    required String userEmail,
    required String password,
  }) {
    return LoginRequestModel(
      email: userEmail,
      password: password,
    );
  }

  void _isLoadingChange() {
    isLoading = !isLoading;
  }
}

mixin _ProviderConstant {
  late final RestfulErrorModel? error;
  final LoginService _loginService = LoginService();
  bool isLoading = false;
  bool isError = false;
  LoginResponseModel? loginRespModel;
}
