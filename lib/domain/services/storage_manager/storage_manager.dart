import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  StorageManager({required this.sharedPreferences});
}
