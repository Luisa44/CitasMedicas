import './features/auth/login/login.view.dart';
import './features/auth/register/register.view.dart';
import './features/auth/account-validation/account_validation.view.dart';
import './features/perfil/perfil.view.dart';
import './features/medical-appointments/list/medical_appointment_list.view.dart';
import './features/medical-appointments/edit/medical_appointment_edit.view.dart';
import './features/medical-appointments/detail/medical_appointment_detail.view.dart';
import './features/medical-appointments/doctors-available/medical_appointment_doctors.view.dart';
import './features/doctors/edit/doctor_list.view.dart';
import './features/doctors/list/doctor_list.view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Citas Medicas',
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        AccountValidationPage.routeName: (context) => const AccountValidationPage(),
        PerfilPage.routeName: (context) => const PerfilPage(),
        MedicalAppointmentListPage.routeName: (context) => const MedicalAppointmentListPage(),
        MedicalAppointmentEditPage.routeName: (context) => const MedicalAppointmentEditPage(),
        MedicalAppointmentDetailPage.routeName: (context) => const MedicalAppointmentDetailPage(),
        MedicalAppointmentDoctorsPage.routeName: (context) => const MedicalAppointmentDoctorsPage(),
        DoctorListPage.routeName: (context) => const DoctorListPage(),
        DoctorEditPage.routeName: (context) => const DoctorEditPage(),
      },
    )
  );
}