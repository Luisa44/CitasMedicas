import 'package:app/features/auth/account-validation/account_validation.view.dart';
import 'package:app/features/medical-appointments/list/medical_appointment_list.view.dart';
import 'package:app/features/users/list/user_list.view.dart';
import 'package:app/utils/session/session.model.dart';
import './login.model.dart';
import 'package:flutter/material.dart';
import './login.service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class LoginController {
  BuildContext context;
  LoginService service = LoginService();

  LoginController(this.context);

  Future<bool> signIn(Login data) async {
    LoginResponse? response = await service.signIn(data);

    if(response == null){
      return false;
    }

    Map<String, dynamic> decodedToken = JwtDecoder.decode(response.token);

    Session userSession = Session(
      token: response.token, 
      active:decodedToken['activo'], 
      email: decodedToken['email'],  
      role: decodedToken['role'], 
      userId: decodedToken['idUser']
    );

    await SessionManager().set('user_session', userSession);

    if(userSession.active == false){
      Navigator.pushNamed(context, AccountValidationPage.routeName);
    }else {
      if(userSession.role == 'administrator'){
      Navigator.pushNamed(context, UserListPage.routeName);
      }else if(userSession.role == 'doctor' || userSession.role == 'patient'){
        Navigator.pushNamed(context, MedicalAppointmentListPage.routeName);
      }
    }

    return true;
  }
}
