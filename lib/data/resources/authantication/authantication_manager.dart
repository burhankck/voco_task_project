import 'package:voco_task_project/presentation/controller/login/login_token_cache_controller.dart';

class AuthManager with TokenCacheManager {
  static final AuthManager _instance = AuthManager._init();
  static AuthManager get instance => _instance;
  AuthManager._init();
  Future<bool> isAuthController() async {
    String? token = await getTokenFromStorage();
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> logoutController() async {
    await removeTokenFromStorage();
  }
}
