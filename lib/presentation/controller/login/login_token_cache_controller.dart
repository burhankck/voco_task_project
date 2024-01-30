import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin TokenCacheManager {
  Future<bool> saveTokenToStorage({required String token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(TokenKey.TOKEN.val, token);
    return true;
  }

  Future<String?> getTokenFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint(prefs.getString(TokenKey.TOKEN.val));
    return prefs.getString(TokenKey.TOKEN.val);
  }

  Future<void> removeTokenFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(TokenKey.TOKEN.val);
  }
}

enum TokenKey {
  TOKEN("token");

  final String val;
  const TokenKey(this.val);
}
