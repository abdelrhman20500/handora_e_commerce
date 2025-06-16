
class UpdatePasswordModel{
  int? status;
  String? message;

  UpdatePasswordModel({this.status, this.message});

  UpdatePasswordModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if(json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["message"] = message;
    return data;
  }
}