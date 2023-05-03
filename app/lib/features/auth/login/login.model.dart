class Login {
  String? email;
  String? contrasena;

  Login({this.email, this.contrasena});

  Login.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    contrasena = json["contrasena"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["contrasena"] = contrasena;
    return _data;
  }
}

class LoginResponse {
  String token = '';

  LoginResponse({this.token = ''});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["token"] = token;
    return _data;
  }
}
