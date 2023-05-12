import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../constants/api_path.dart' as constants;
import './register.model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

// class UserService extends ChangeNotifier {
//   void signIn(Register data) async {
//     Uri url =
//         Uri.https(constants.serviceHost, '${constants.apiPath}/auth/sign-up');

//     Map<String, String> headers = {
//       "Content-Type": "application/json",
//       "Accept": "application/json"
//     };

//     try {
//       var response = await http.post(url,
//           body: jsonEncode(data.toJson()), headers: headers);

//       if (response.statusCode != 200) {
//       }

//       //return //RegisterResponse.fromJson(json.decode(response.body));
//     } catch (err) {
//     }
//   }
// }

class UserService {
  Future<bool> registerUser(User user) async {
    try {
      // Create a JSON request body
      Map<String, dynamic> body = user.toMap();

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };

      // Make a POST request to the API endpoint
      Uri url =
          Uri.https(constants.serviceHost, '${constants.apiPath}/auth/sign-up');
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      // Check the response status code
      if (response.statusCode == 200) {
        print("Su usuario ha sido registrado");
        return true;
      } else {
        print("Ha ocurrido un error");
        return false;
      }
    } catch (e) {
      // Return false on any exceptions
      return false;
    }
  }
}
