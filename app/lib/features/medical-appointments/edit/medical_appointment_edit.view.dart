import 'package:flutter/material.dart';

class MedicalAppointmentEditPage extends StatefulWidget {
  const MedicalAppointmentEditPage({super.key});

  static String routeName = '/medical-appointments/edit';
  // This widget is the root of your application.
  @override
  State<MedicalAppointmentEditPage> createState() => _MedicalAppointmentEditPage();
}

class _MedicalAppointmentEditPage extends State<MedicalAppointmentEditPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('Medical Appointment Edit Page'));
  }
}
