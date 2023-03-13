import 'package:flutter/material.dart';

class MedicalAppointmentDoctorsPage extends StatefulWidget {
  const MedicalAppointmentDoctorsPage({super.key});

  static String routeName = '/medical-appointments/edit';
  // This widget is the root of your application.
  @override
  State<MedicalAppointmentDoctorsPage> createState() => _MedicalAppointmentDoctorsPage();
}

class _MedicalAppointmentDoctorsPage extends State<MedicalAppointmentDoctorsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('Medical Appointment Doctors Page'));
  }
}
