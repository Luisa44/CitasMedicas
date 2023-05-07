import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../constants/api_path.dart' as constants;
import 'package:flutter_session_manager/flutter_session_manager.dart';
import './user_list.model.dart';
import 'package:app/utils/session/session.model.dart';

class UserService extends ChangeNotifier {
  Future<List<User>> getAll() async {
    Uri url = Uri.https(constants.serviceHost, '${constants.apiPath}/doctors');

    try {
      Session userSession =
          Session.fromJson(await SessionManager().get('user_session'));

      Map<String, String> headers = {
        "Authorization": 'Bearer ${userSession.token ?? ''}',
        "Accept": "application/json"
      };
      var response = await http.get(url, headers: headers);

      if (response.statusCode != 200) {
        return List.empty();
      }

      return User.fromJsonList(response.body);
    } catch (err) {
      print(err);
      return List.empty();
    }
  }
}
