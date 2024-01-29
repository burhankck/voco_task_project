import 'package:shared_preferences/shared_preferences.dart';

mixin TokenCacheManager {
  Future<bool> saveToken({required String token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(TokenKey.TOKEN.toString(), token);
    return true;
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(TokenKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(TokenKey.TOKEN.toString());
  }
}

enum TokenKey { TOKEN }
