// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import 'dart:core';
import 'package:voco_task_project/domain/services/network_manager/reflector.dart'
    as prefix0;
import 'package:voco_task_project/presentation/model/login/login_request_model.dart'
    as prefix1;
import 'package:voco_task_project/presentation/model/login/login_response_model.dart'
    as prefix2;
import 'package:voco_task_project/presentation/model/user_list/user_list_response_model.dart'
    as prefix3;

// ignore_for_file: camel_case_types
// ignore_for_file: implementation_imports
// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.Reflector(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'LoginRequestModel',
            r'.LoginRequestModel',
            134217735,
            0,
            const prefix0.Reflector(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {
              r'': (bool b) => ({email, password}) => b
                  ? prefix1.LoginRequestModel(email: email, password: password)
                  : null,
              r'fromJson': (bool b) =>
                  (json) => b ? prefix1.LoginRequestModel.fromJson(json) : null
            },
            -1,
            -1,
            const <int>[-1],
            null,
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'toJson': 0,
              r'email': 0,
              r'email=': 1,
              r'password': 0,
              r'password=': 1
            }),
        r.NonGenericClassMirrorImpl(
            r'LoginResponseModel',
            r'.LoginResponseModel',
            134217735,
            1,
            const prefix0.Reflector(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {
              r'': (bool b) => ({token}) =>
                  b ? prefix2.LoginResponseModel(token: token) : null,
              r'fromJson': (bool b) =>
                  (json) => b ? prefix2.LoginResponseModel.fromJson(json) : null
            },
            -1,
            -1,
            const <int>[-1],
            null,
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'toJson': 0,
              r'token': 0,
              r'token=': 1
            }),
        r.NonGenericClassMirrorImpl(
            r'UserListResponseModel',
            r'.UserListResponseModel',
            134217735,
            2,
            const prefix0.Reflector(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {
              r'': (bool b) =>
                  ({page, perPage, total, totalPages, userList, support}) => b
                      ? prefix3.UserListResponseModel(
                          page: page,
                          perPage: perPage,
                          support: support,
                          total: total,
                          totalPages: totalPages,
                          userList: userList)
                      : null,
              r'fromJson': (bool b) => (json) =>
                  b ? prefix3.UserListResponseModel.fromJson(json) : null
            },
            -1,
            -1,
            const <int>[-1],
            null,
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'toJson': 0,
              r'page': 0,
              r'page=': 1,
              r'perPage': 0,
              r'perPage=': 1,
              r'total': 0,
              r'total=': 1,
              r'totalPages': 0,
              r'totalPages=': 1,
              r'userList': 0,
              r'userList=': 1,
              r'support': 0,
              r'support=': 1
            })
      ],
      null,
      null,
      <Type>[
        prefix1.LoginRequestModel,
        prefix2.LoginResponseModel,
        prefix3.UserListResponseModel
      ],
      3,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'toJson': (dynamic instance) => instance.toJson,
        r'email': (dynamic instance) => instance.email,
        r'password': (dynamic instance) => instance.password,
        r'token': (dynamic instance) => instance.token,
        r'page': (dynamic instance) => instance.page,
        r'perPage': (dynamic instance) => instance.perPage,
        r'total': (dynamic instance) => instance.total,
        r'totalPages': (dynamic instance) => instance.totalPages,
        r'userList': (dynamic instance) => instance.userList,
        r'support': (dynamic instance) => instance.support
      },
      {
        r'email=': (dynamic instance, value) => instance.email = value,
        r'password=': (dynamic instance, value) => instance.password = value,
        r'token=': (dynamic instance, value) => instance.token = value,
        r'page=': (dynamic instance, value) => instance.page = value,
        r'perPage=': (dynamic instance, value) => instance.perPage = value,
        r'total=': (dynamic instance, value) => instance.total = value,
        r'totalPages=': (dynamic instance, value) =>
            instance.totalPages = value,
        r'userList=': (dynamic instance, value) => instance.userList = value,
        r'support=': (dynamic instance, value) => instance.support = value
      },
      null,
      [
        const [0, 0, null],
        const [1, 0, null],
        const [
          0,
          0,
          const [#email, #password]
        ],
        const [
          0,
          0,
          const [#token]
        ],
        const [
          0,
          0,
          const [#page, #perPage, #total, #totalPages, #userList, #support]
        ]
      ])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}