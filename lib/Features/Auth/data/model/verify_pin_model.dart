
class VerifyPinModel {
  int? status;
  String? message;
  String? email;

  VerifyPinModel({this.status, this.message, this.email});

  VerifyPinModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["message"] = message;
    data["email"] = email;
    return data;
  }
}