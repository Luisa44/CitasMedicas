import 'package:app/features/medical-appointments/list/medical_appointment_list.model.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import '../../../constants/api_path.dart' as constants;
import 'package:app/utils/session/session.model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MedicalAppointmentListService extends ChangeNotifier {
  
  Future<List<MedicalAppointmentDetail>> getAll() async {
    Uri url = Uri.https(constants.serviceHost, '${constants.apiPath}/medical-appointments');

    try {
      Session userSession = Session.fromJson(await SessionManager().get('user_session'));

      Map<String, String> headers = {
        "Authorization": 'Bearer ${userSession.token ?? ''}'
      };
      var response = await http.get(url, headers: headers);

      if (response.statusCode != 200) {
        return List.empty();
      }

      return MedicalAppointmentDetail.fromJsonList(response.body);
    } catch (err) {
      print(err);
      return List.empty();
    }
  }

  Future<bool> deteleOne(int id) async {
    Uri url = Uri.https(constants.serviceHost, '${constants.apiPath}/medical-appointments/$id');

    try {
      Session userSession = Session.fromJson(await SessionManager().get('user_session'));

      Map<String, String> headers = {
        "Authorization": 'Bearer ${userSession.token ?? ''}'
      };
      var response = await http.delete(url, headers: headers);

      if (response.statusCode != 200) {
        return false;
      }

      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }
}
