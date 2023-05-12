import 'package:app/features/users/list/user_list.view.dart';
import './features/auth/login/login.view.dart';
import './features/auth/register/register.view.dart';
import './features/auth/account-validation/account_validation.view.dart';
import './features/auth/forgotten-password/forgotten-password.view.dart';
import './features/perfil/perfil.view.dart';
import './features/medical-appointments/detail/medical_appointment_detail.view.dart';
import './features/medical-appointments/list/medical_appointment_list.view.dart';
import './features/medical-appointments/edit/medical_appointment_edit.view.dart';
import './features/medical-appointments/reschedule/medical_appointment_reschedule.view.dart';
import './features/medical-appointments/doctor-programer/medical_appointment_doctor_programer.view.dart';
import 'features/users/edit/user_edit.view.dart';
//import 'package:provider/provider.dart';
import 'features/users/list/user_list.view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Citas Medicas',
      //theme: ThemeData(fontFamily: 'Archivo'),
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        AccountValidationPage.routeName: (context) => const AccountValidationPage(),
        ForgottenPasswordPage.routeName: (context) => const ForgottenPasswordPage(),
        PerfilPage.routeName: (context) => const PerfilPage(),
        MedicalAppointmentListPage.routeName: (context) => const MedicalAppointmentListPage(),
        MedicalAppointmentDetailPage.routeName: (context) => const MedicalAppointmentDetailPage(),
        MedicalAppointmentEditPage.routeName: (context) => const MedicalAppointmentEditPage(),
        MedicalAppointmentDocProgramerPage.routeName: (context) => const MedicalAppointmentDocProgramerPage(),
        MedicalAppointmentReschedulePage.routeName: (context) => const MedicalAppointmentReschedulePage(),
        UserListPage.routeName: (context) => const UserListPage(),
        UserEditPage.routeName: (context) => const UserEditPage(),
      },
    )
  );
}