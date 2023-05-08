import 'dart:convert';

class MedicalAppointment {
  int? headquarter;
  String? date;
  String? description;

  MedicalAppointment({this.headquarter, this.date, this.description});

  MedicalAppointment.fromJson(Map<String, dynamic> json) {
    headquarter = json["headquarter"];
    date = json["date"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["headquarter"] = headquarter;
    _data["date"] = date;
    _data["description"] = description;
    return _data;
  }
}

class Headquarter {
  int? id;
  String? description;
  String? address;
  String? telephone;
  dynamic email;

  Headquarter(
      {this.id,
      this.description,
      this.address,
      this.telephone,
      this.email});

  Headquarter.fromJson(Map<String, dynamic> json) {
    id = json["idsedecitamedica"];
    description = json["descripcionsedecitamedica"];
    address = json["direccionsedecitamedica"];
    telephone = json["telefonosedecitamedica"];
    email = json["correosedecitamedica"];
  }

  static List<Headquarter> fromJsonList(String jsonList) {
    var list = jsonDecode(jsonList) as List<dynamic>;
    return list.map((map) => Headquarter.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["idsedecitamedica"] = id;
    _data["descripcionsedecitamedica"] = description;
    _data["direccionsedecitamedica"] = address;
    _data["telefonosedecitamedica"] = telephone;
    _data["correosedecitamedica"] = email;
    return _data;
  }
}
