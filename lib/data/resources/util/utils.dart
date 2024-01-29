import 'package:flutter/material.dart';
import 'package:voco_task_project/domain/services/network_manager/base_result_model.dart';

class Utils {
  static RestfulErrorModel normalizationSystemError(Object? error) {
    String errorText = error.toString();
    List<String> splittedList = List.filled(2, '');
    splittedList = errorText.split(':');
    return RestfulErrorModel(
        title: splittedList.first, description: splittedList.last);
  }
}
