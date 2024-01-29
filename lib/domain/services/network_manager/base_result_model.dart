abstract class BaseResultModel {
  BaseResultModel();

  BaseResultModel.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}

class RestfulErrorModel {
  String title;
  String description;

  RestfulErrorModel({
    required this.title,
    required this.description,
  });
}
