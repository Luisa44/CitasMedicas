import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../constants/api_path.dart' as constants;
import './login.model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginService extends ChangeNotifier {
  Future<LoginResponse?> signIn(Login data) async {
    Uri url =
        Uri.https(constants.serviceHost, '${constants.apiPath}/auth/sign-in');

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    try {
      var response = await http.post(url,
          body: jsonEncode(data.toJson()), headers: headers);

      if (response.statusCode != 200) {
        return null;
      }

      return LoginResponse.fromJson(json.decode(response.body));
    } catch (err) {
      return null;
    }
  }
}
