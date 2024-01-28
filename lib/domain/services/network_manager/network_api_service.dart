// ignore_for_file: depend_on_referenced_packages, prefer_const_declarations, avoid_function_literals_in_foreach_calls, await_only_futures

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reflectable/reflectable.dart';
import 'package:voco_task_project/domain/services/network_manager/base_api_service.dart';
import 'package:voco_task_project/domain/services/network_manager/base_result_model.dart';
import 'package:voco_task_project/domain/services/network_manager/error_handler.dart';
import 'package:voco_task_project/domain/services/network_manager/failure.dart';
import 'package:voco_task_project/domain/services/network_manager/reflector.dart';

class NetworkApiServices extends BaseApiService {
  static final NetworkApiServices _instance = NetworkApiServices._init();
  static NetworkApiServices get instance => _instance;
  NetworkApiServices._init();
  dynamic responseJson;

  // Serializes json.
  dynamic jsonSerialize(dynamic jsonResponse) => json.decode(jsonResponse);

  //HTTP[GET]
  @override
  Future getApiResponse<T extends BaseResultModel>(
    String baseAdress,
    String path, {
    bool isList = false,
  }) async {
    responseJson = "";
    var classMirror = reflector.reflectType(T) as ClassMirror;
    String url = baseAdress + path;
    try {
      final response = await http
          .get(Uri.parse(url), headers: _serviceHeader)
          .timeout(const Duration(seconds: 30));

      responseJson = checkStatus<T>(response, isList, classMirror);
    } on SocketException {
      throw Failure(
        ResponseCode.NO_INTERNET_CONNECTION,
        ResponseMessage.NO_INTERNET_CONNECTION,
      );
    } on Error catch (e) {
      debugPrint("getApiResponse() method error: $e");
      throw Failure(
        ResponseCode.UNKNOWN,
        ResponseMessage.UNKNOWN,
      );
    }
    return responseJson;
  }

  //HTTP[POST]
  @override
  Future postApiResponse<T extends BaseResultModel>(
    String baseAdress,
    String path,
    dynamic data, {
    bool isList = false,
  }) async {
    responseJson = "";
    var classMirror = reflector.reflectType(T) as ClassMirror;
    String url = baseAdress + path;
    try {
      final response = await http
          .post(Uri.parse(url), headers: _serviceHeader, body: jsonEncode(data))
          .timeout(const Duration(seconds: 30)); // -> timeout

      responseJson = checkStatus<T>(response, isList, classMirror);
    } on SocketException {
      throw Failure(
        ResponseCode.NO_INTERNET_CONNECTION,
        ResponseMessage.NO_INTERNET_CONNECTION,
      );
    } on Error catch (e) {
      debugPrint("getApiResponse() method error: $e");
      throw Failure(
        ResponseCode.UNKNOWN,
        ResponseMessage.UNKNOWN,
      );
    }

    return responseJson;
  }

  // It acts according to the status code returned from the response.
  dynamic checkStatus<T>(
    http.Response response,
    bool isList,
    ClassMirror classMirror,
  ) {
    switch (response.statusCode) {
      case HttpStatus.ok:
        return isList
            ? jsonToObjectList<T>(classMirror: classMirror, body: response.body)
            : jsonToObject<T>(classMirror: classMirror, body: response.body);
      case HttpStatus.created:
        throw DataSource.NO_CONTENT.getFailure();
      case HttpStatus.notFound:
        throw DataSource.NOT_FOUND.getFailure();
      case HttpStatus.badRequest:
        throw DataSource.BAD_REQUEST.getFailure();
      case HttpStatus.unauthorized:
        throw DataSource.UNAUTHORISED.getFailure();
      case HttpStatus.forbidden:
        throw DataSource.FORBIDDEN.getFailure();
      case HttpStatus.internalServerError:
        throw DataSource.INTERNAL_SERVER_ERROR.getFailure();

      default:
        throw DataSource.UNKNOWN.getFailure();
    }
  }

  /// return List<Model>
  List<T>? jsonToObjectList<T>({
    required var classMirror,
    var body,
  }) {
    body = jsonSerialize(body);
    if (body == null) {
      return null;
    } else {
      var listResponse = <T>[];
      debugPrint(body.runtimeType.toString()); //burasi kaldirilmayacak(onemli)
      if (body is List) {
        for (var item in body) {
          _jsonToModel<T>(classMirror, item, listResponse);
        }
      } else {
        while (body is! List) {
          body = jsonSerialize(body);
          if (body is List) {
            body.forEach((item) {
              _jsonToModel<T>(classMirror, item, listResponse);
            });
          }
        }
      }
      return listResponse;
    }
  }

  void _jsonToModel<T>(classMirror, item, List<dynamic> listResponse) {
    T responsChildValue;
    responsChildValue = classMirror.newInstance(_JsonHelper.FROM_JSON, [item]);
    listResponse.add(responsChildValue);
  }

  /// return Model
  T? jsonToObject<T>({required var classMirror, var body}) {
    final Type stringType = String;
    do {
      body = jsonSerialize(body);
    } while (body.runtimeType == stringType);
    if (body == null) {
      return null;
    } else {
      T responsChildValue =
          classMirror.newInstance(_JsonHelper.FROM_JSON, [body]);
      return responsChildValue;
    }
  }

  Map<String, String> get _serviceHeader => {
        "Content-Type": "application/json",
      };
}

class _JsonHelper {
  // ignore: constant_identifier_names
  static const FROM_JSON = "fromJson";
}
