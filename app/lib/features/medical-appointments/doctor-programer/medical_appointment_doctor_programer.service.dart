import 'package:app/features/medical-appointments/doctor-programer/medical_appointment_doctor_programer.model.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import '../../../constants/api_path.dart' as constants;
import 'package:app/utils/session/session.model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class MedicalAppointmentProgramerService extends ChangeNotifier {
  Future<bool> save(MedicalAppointment data) async {
    Uri url =Uri.https(constants.serviceHost, '${constants.apiPath}/medical-appointments');

    try {
      Session userSession = Session.fromJson(await SessionManager().get('user_session'));

      Map<String, String> headers = {
        "Authorization": 'Bearer ${userSession.token ?? ''}',
        "Content-Type": "application/json",
        "Accept": "application/json"
      };

      var response = await http.post(url, body: jsonEncode(data.toJson()), headers: headers);

      if (response.statusCode != 201) {
        return false;
      }

      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  Future<List<Headquarter>> getAllHeadquarters() async {
    Uri url = Uri.https(constants.serviceHost, '${constants.apiPath}/headquarters');

    try {
      Session userSession = Session.fromJson(await SessionManager().get('user_session'));

      Map<String, String> headers = {
        "Authorization": 'Bearer ${userSession.token ?? ''}'
      };
      var response = await http.get(url, headers: headers);

      if (response.statusCode != 200) {
        return List.empty();
      }

      return Headquarter.fromJsonList(response.body);
    } catch (err) {
      print(err);
      return List.empty();
    }
  }
}
