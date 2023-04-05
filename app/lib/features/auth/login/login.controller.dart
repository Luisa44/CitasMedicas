import './login.model.dart';
import 'package:flutter/material.dart';
import '../../medical-appointments/list/medical_appointment_list.view.dart';
import '../../users/list/user_list.view.dart';
import '../account-validation/account_validation.view.dart';

class LoginController {
  BuildContext context;

  LoginController(this.context);
  Map<String,String> userPage = {
    'admin@example.com': UserListPage.routeName,
    'new_user@example.com': AccountValidationPage.routeName,
    'user@example.com': MedicalAppointmentListPage.routeName,
    'doctor@example.com': MedicalAppointmentListPage.routeName
  };

  bool validateUser(Login login) {
    String navigateRoute = '';
    String defaulRoute = MedicalAppointmentListPage.routeName;

    if (userPage.containsKey(login.getEmail())) {
      navigateRoute = userPage[login.getEmail().toString()]!;
      if(login.getEmail().toString() == 'doctor@example.com' || login.getEmail() == 'user@example.com'){
        Navigator.pushNamed(context, navigateRoute, arguments: login.getEmail().toString());
      }else{
        Navigator.pushNamed(context, navigateRoute);
      }
      return true;
    }

    return false;
  }
}
