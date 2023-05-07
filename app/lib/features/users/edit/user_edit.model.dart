import 'dart:convert';

class Speciality {
  int? id;
  String? description;

  Speciality({this.id, this.description});

  Speciality.fromJson(Map<String, dynamic> json) {
    id = json["idespecialidad"];
    description = json["descripcion"];
  }

  static List<Speciality> fromJsonList(String jsonList) {
    var list = jsonDecode(jsonList) as List<dynamic>;
    return list.map((map) => Speciality.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["idespecialidad"] = id;
    _data["descripcion"] = description;
    return _data;
  }
}