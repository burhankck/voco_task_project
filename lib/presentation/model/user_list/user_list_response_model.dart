import 'package:voco_task_project/domain/services/network_manager/base_result_model.dart';
import 'package:voco_task_project/domain/services/network_manager/reflector.dart';

@reflector
class UserListResponseModel extends BaseResultModel {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<UserInfo> userList;
  Support support;

  UserListResponseModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.userList,
    required this.support,
  });

  factory UserListResponseModel.fromJson(Map<String, dynamic> json) =>
      UserListResponseModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        userList:
            List<UserInfo>.from(json["data"].map((x) => UserInfo.fromJson(x))),
        support: Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(userList.map((x) => x.toJson())),
        "support": support.toJson(),
      };
}

class UserInfo {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  UserInfo({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  String url;
  String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
