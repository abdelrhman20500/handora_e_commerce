
class LoginModel {
  String? email;
  String? token;
  String? displayName;
  dynamic image;

  LoginModel({this.email, this.token, this.displayName, this.image});

  LoginModel.fromJson(Map<String, dynamic> json) {
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["token"] is String) {
      token = json["token"];
    }
    if(json["displayName"] is String) {
      displayName = json["displayName"];
    }
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["token"] = token;
    data["displayName"] = displayName;
    data["image"] = image;
    return data;
  }
}