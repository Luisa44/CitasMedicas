import './login.model.dart';
import 'package:flutter/material.dart';
import '../../medical-appointments/list/medical_appointment_list.view.dart';
import '../../doctors/list/doctor_list.view.dart';
import '../account-validation/account_validation.view.dart';

class LoginController {
  BuildContext context;

  LoginController(this.context);
  Map<String,String> userPage = {
    'admin@example.com':DoctorListPage.routeName,
    'new_user@example.com':AccountValidationPage.routeName
  };

  validateUser(Login login) {
    String navigateRoute = '';
    String defaulRoute = MedicalAppointmentListPage.routeName;

    if (userPage.containsKey(login.getEmail())) {
      navigateRoute = userPage[login.getEmail().toString()]!;
    }else{
      navigateRoute = defaulRoute;
    }

    Navigator.pushNamed(context, navigateRoute);
  }
}
