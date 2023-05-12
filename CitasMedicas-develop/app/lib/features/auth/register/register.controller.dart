import 'package:app/features/auth/account-validation/account_validation.view.dart';
import 'package:app/features/medical-appointments/list/medical_appointment_list.view.dart';
import 'package:app/features/users/list/user_list.view.dart';
import 'package:app/utils/session/session.model.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'register.model.dart';
import 'register.service.dart';

// class UserController {
//   List<Register> users = [];
//   RegisterService service = RegisterService();

//   void registerUser(Register data) {
//     users.add(data);
//   }

// }

class UserController {
  final UserService _userService = UserService();

  Future<void> registerUser(
      BuildContext context, String user_name, String email, String contrasena) async {
    User user = User(user_name: user_name, email: email, contrasena: contrasena);
    bool isRegistered = await _userService.registerUser(user);

    if (isRegistered) {
      print("Su usuario ha sido registrado");
    } else {
      print("Ha ocurrido un error");
    }
  }
}

