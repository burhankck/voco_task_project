import 'package:flutter/material.dart';
import 'package:voco_task_project/domain/services/network_manager/base_result_model.dart';
import 'package:voco_task_project/presentation/controller/login/login_token_cache_controller.dart';
import 'package:voco_task_project/presentation/model/login/login_request_model.dart';
import 'package:voco_task_project/presentation/model/login/login_response_model.dart';
import 'package:voco_task_project/presentation/service/login_service.dart';

class LoginAuthStateController extends ChangeNotifier
    with _ProviderConstant, TokenCacheManager {
  Future<bool> userAuth({
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

        isAuthSuccess = _isAuthSuccessControl(token: responseValue.token);
        notifyListeners();
        saveTokenToStorage(token: responseValue.token);
        return isAuthSuccess;
      }
      notifyListeners();
      return isAuthSuccess;
    }).onError((error, stackTrace) {
      isAuthSuccess = false;
      _isLoadingChange();
      notifyListeners();
      return isAuthSuccess;
    });
    return isAuthSuccess;
  }

  bool _isAuthSuccessControl({required String? token}) {
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
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
    notifyListeners();
  }

  void changeIsSecure() {
    isSecure = !isSecure;
    notifyListeners();
  }
}

mixin _ProviderConstant {
  RestfulErrorModel? error;
  final LoginService _loginService = LoginService();
  bool isLoading = false;
  bool isError = false;
  bool isAuthSuccess = false;
  bool isSecure = false;
  LoginResponseModel?
      loginRespModel; //LoginProvider uzerinden, tum projede erisim saglanabilir.
}
