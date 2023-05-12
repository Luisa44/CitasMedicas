// class Register {
//   String? user_name;
//   String? email;
//   String? contrasena;

//   Register({ this.user_name, this.email, this.contrasena});

//  Register.fromJson(Map<String, dynamic> json) {
//     user_name = json["user_name"];
//     email = json["email"];
//     contrasena = json["contrasena"];
//   }

//     Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["user_name"] = user_name;
//     _data["email"] = email;
//     _data["contrasena"] = contrasena;
//     return _data;
//   }
// }

class User {
  String user_name;
  String email;
  String contrasena;

  User({required this.user_name, required this.email, required this.contrasena});

  Map<String, dynamic> toMap() {
    return {
      'user_name': user_name,
      'email': email,
      'contrasena': contrasena,
    };
  }
}




