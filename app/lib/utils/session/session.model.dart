class Session {
  String? token;
  String? userName;
  String? role;
  bool? active;
  int? userId;
  String? email;

  Session({this.token, this.role, this.active, this.userId, this.email, this.userName});

  Session.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    role = json["role"];
    active = json["active"];
    userId = json["user_id"];
    email = json["email"];
    userName = json["user_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["token"] = token;
    _data["role"] = role;
    _data["active"] = active;
    _data["user_id"] = userId;
    _data["email"] = email;
    _data["user_name"] = userName;
    return _data;
  }
}
