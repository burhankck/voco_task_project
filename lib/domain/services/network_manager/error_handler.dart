// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:voco_task_project/domain/services/network_manager/failure.dart';

enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  UNKNOWN,
  NO_INTERNET_CONNECTION,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      default:
        return Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN);
    }
  }
}

class ResponseCode {
  //Api status code
  static const int SUCCESS = 200; // succes with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected the request
  static const int UNAUTHORISED = 401; //failure user is not authorised
  static const int NOT_FOUND = 404; //failure, api url is not correct and found
  static const int INTERNAL_SERVER_ERROR =
      500; // failure, crash happened in server side
  //local status code
  static String UNKNOWN = _StringConstant.UNKNOWN;
  static String NO_INTERNET_CONNECTION = _StringConstant.NO_INTERNET_CONNECTION;
}

class ResponseMessage {
  //Api status code
  static String SUCCESS =
      _StringConstant.PROCESS_SUCCESS; // succes with data (200)
  static String NO_CONTENT =
      _StringConstant.PROCESS_SUCCESS; // success with no content (201)
  static String BAD_REQUEST =
      _StringConstant.REQUEST_DENIED; // failure, api rejected the request (400)
  static String FORBIDDEN =
      _StringConstant.REQUEST_DENIED; // failure, api rejected the request (403)
  static String UNAUTHORISED =
      _StringConstant.REQUEST_DENIED; //failure user is not authorised (401)
  static String NOT_FOUND = _StringConstant
      .REQUEST_DENIED; //failure, api url is not correct and found (404)
  static String INTERNAL_SERVER_ERROR = _StringConstant
      .SERVER_ERROR; // failure, crash happened in server side (500)
  //local status code
  static String UNKNOWN = _StringConstant.UNKNOWN;
  static String NO_INTERNET_CONNECTION = _StringConstant.NO_INTERNET_CONNECTION;
}

class _StringConstant {
  static String PROCESS_SUCCESS = "İşlem başarılı.";
  static String REQUEST_DENIED = "İstek reddedildi.";
  static String SERVER_ERROR = "Sunucu hatası.";
  static String UNKNOWN = "Bilinmeyen hata";
  static String NO_INTERNET_CONNECTION = "İnternet bağlantı hatası";
}
