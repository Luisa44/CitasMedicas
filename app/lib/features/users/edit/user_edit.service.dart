import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../constants/api_path.dart' as constants;
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:app/features/users/list/user_list.model.dart';
import 'package:app/features/users/edit/user_edit.model.dart';
import 'package:app/utils/session/session.model.dart';

class UserEditService extends ChangeNotifier {
  Future<List<Speciality>> getAllSpecialities() async {
    Uri url = Uri.https(constants.serviceHost, '${constants.apiPath}/specialities');

    try {
      Session userSession =
          Session.fromJson(await SessionManager().get('user_session'));

      Map<String, String> headers = {
        "Authorization": 'Bearer ${userSession.token ?? ''}'
      };
      var response = await http.get(url, headers: headers);

      if (response.statusCode != 200) {
        return List.empty();
      }

      return Speciality.fromJsonList(response.body);
    } catch (err) {
      print(err);
      return List.empty();
    }
  }

  Future<bool> save(User data) async {
    Uri url = Uri.https(constants.serviceHost, '${constants.apiPath}/users');

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
}
