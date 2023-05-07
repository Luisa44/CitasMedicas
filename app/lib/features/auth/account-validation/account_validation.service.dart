import 'package:app/features/auth/account-validation/account_validation.model.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:app/utils/session/session.model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../constants/api_path.dart' as constants;
import 'dart:convert';

class ChangePassService extends ChangeNotifier {
  
  Future<bool> changePassword(ChangePass data) async {
    Uri url = Uri.https(constants.serviceHost, '${constants.apiPath}/auth/change-password');

    try {
      Session userSession = Session.fromJson(await SessionManager().get('user_session'));

      Map<String, String> headers = {
        "Authorization": 'Bearer ${userSession.token ?? ''}',
        "Content-Type": "application/json",
        "Accept": "application/json"
      };

      var response = await http.post(url,
          body: jsonEncode(data.toJson()), headers: headers);

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
