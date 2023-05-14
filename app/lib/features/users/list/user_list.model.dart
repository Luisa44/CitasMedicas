import 'dart:convert';

class User {
  int? id;
  String? name;
  String? surname;
  String? identification;
  String? address;
  String? email;
  String? phone;
  String? role;
  int? speciality;

  User({
      this.id,
      this.name,
      this.surname,
      this.identification,
      this.email,
      this.address,
      this.phone,
      this.role,
      this.speciality
    });

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    surname = json["surname"];
    identification = json["identification"];
    address = json["address"];
    phone = json["phone"];
    role = json["role"];
    email = json["email"];
    speciality = json["speciality"];
  }

  static List<User> fromJsonList(String jsonList) {
    var list = jsonDecode(jsonList) as List<dynamic>;
    return list.map((map) => User.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["surname"] = surname;
    _data["identification"] = identification;
    _data["address"] = address;
    _data["phone"] = phone;
    _data["role"] = role;
    _data["email"] = email;
    _data["speciality"] = speciality;
    return _data;
  }
}
