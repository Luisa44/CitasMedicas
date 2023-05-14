class Register {
  String? userName;
  String? email;
  String? contrasena;

  Register({this.userName, this.email, this.contrasena});

  Register.fromJson(Map<String, dynamic> json) {
    userName = json["user_name"];
    email = json["email"];
    contrasena = json["contrasena"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["user_name"] = userName;
    _data["email"] = email;
    _data["contrasena"] = contrasena;
    return _data;
  }
}
