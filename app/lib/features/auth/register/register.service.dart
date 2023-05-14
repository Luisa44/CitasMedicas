import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../constants/api_path.dart' as constants;
import './register.model.dart';

class RegisterService extends ChangeNotifier {
  Future<bool> registerUser(Register register) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };

      // Make a POST request to the API endpoint
      Uri url =
          Uri.https(constants.serviceHost, '${constants.apiPath}/auth/sign-up');
      http.Response response =
          await http.post(url, body: jsonEncode(register.toJson()), headers: headers);

      // Check the response status code
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // Return false on any exceptions
      return false;
    }
  }
}
