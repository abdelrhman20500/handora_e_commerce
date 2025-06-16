
class ForgetPasswordModel {
  int? status;
  String? expireAt;
  String? email;

  ForgetPasswordModel({this.status, this.expireAt, this.email});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if(json["expireAt"] is String) {
      expireAt = json["expireAt"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["expireAt"] = expireAt;
    data["email"] = email;
    return data;
  }
}