import 'package:flutter/material.dart';
import 'package:voco_task_project/domain/services/network_manager/base_result_model.dart';
import 'package:voco_task_project/presentation/model/user_list/user_list_response_model.dart';
import 'package:voco_task_project/presentation/service/user_list_service.dart';

class UserListStateController extends ChangeNotifier with _ProviderConstant {
  Future<void> getUserList() async {
    // _isLoadingChange();
    await _userListService.getUserListService().then((responseValue) {
      if (responseValue != null && responseValue.userList.isNotEmpty) {
        // _isLoadingChange();
        userListResponseModel = responseValue;
        isFetchSuccess = true;
        notifyListeners();
      }
    }).onError((error, stackTrace) {
      // _isLoadingChange();
      _changeIsError(isError: true);
      // notifyListeners();
    });
  }

  // void _isLoadingChange() {
  //   isLoading = !isLoading;
  //   notifyListeners();
  // }

  void _changeIsError({required bool isError}) {
    isError = isError;
  }
}

mixin _ProviderConstant {
  RestfulErrorModel? error;
  final UserListService _userListService = UserListService();
  bool isLoading = false;
  bool isError = false;
  bool isFetchSuccess = false;

  UserListResponseModel?
      userListResponseModel; //LoginProvider uzerinden, tum projede erisim saglanabilir.
}
