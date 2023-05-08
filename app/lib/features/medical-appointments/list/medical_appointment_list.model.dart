import 'dart:convert';

class MedicalAppointmentDetail {
  int? id;
  String? state;
  String? date;
  String? description;
  Speciality? speciality;
  Headquarter? headquarter;
  Patient? patient;
  Doctor? doctor;

  MedicalAppointmentDetail(
      {this.id,
      this.state,
      this.date,
      this.speciality,
      this.headquarter,
      this.patient,
      this.doctor});

  MedicalAppointmentDetail.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    state = json["state"];
    date = json["date"];
    description = json["description"];
    speciality = json["speciality"] == null
        ? null
        : Speciality.fromJson(json["speciality"]);
    headquarter = json["headquarter"] == null
        ? null
        : Headquarter.fromJson(json["headquarter"]);
    patient =
        json["patient"] == null ? null : Patient.fromJson(json["patient"]);
    doctor = json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]);
  }

  static List<MedicalAppointmentDetail> fromJsonList(String jsonList) {
    var list = jsonDecode(jsonList) as List<dynamic>;
    return list.map((map) => MedicalAppointmentDetail.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["state"] = state;
    _data["date"] = date;
    _data["description"] = description;
    if (speciality != null) {
      _data["speciality"] = speciality?.toJson();
    }
    if (headquarter != null) {
      _data["headquarter"] = headquarter?.toJson();
    }
    if (patient != null) {
      _data["patient"] = patient?.toJson();
    }
    if (doctor != null) {
      _data["doctor"] = doctor?.toJson();
    }
    return _data;
  }
}

class Doctor {
  String? name;
  String? surname;
  String? phone;

  Doctor({this.name, this.surname, this.phone});

  Doctor.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    surname = json["surname"];
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["surname"] = surname;
    _data["phone"] = phone;
    return _data;
  }
}

class Patient {
  dynamic name;
  dynamic phone;

  Patient({this.name, this.phone});

  Patient.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["phone"] = phone;
    return _data;
  }
}

class Headquarter {
  int? id;
  String? description;
  String? address;

  Headquarter({this.id, this.description, this.address});

  Headquarter.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    description = json["description"];
    address = json["address"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["description"] = description;
    _data["address"] = address;
    return _data;
  }
}

class Speciality {
  int? id;
  String? description;

  Speciality({this.id, this.description});

  Speciality.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["description"] = description;
    return _data;
  }
}
