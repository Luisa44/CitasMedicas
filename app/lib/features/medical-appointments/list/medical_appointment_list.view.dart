import 'package:flutter/material.dart';

class MedicalAppointmentListPage extends StatefulWidget {
  const MedicalAppointmentListPage({super.key});

  static String routeName = '/medical-appointments';
  // This widget is the root of your application.
  @override
  State<MedicalAppointmentListPage> createState() => _MedicalAppointmentListPage();
}

class _MedicalAppointmentListPage extends State<MedicalAppointmentListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('Medical Appointment List Page'));
  }
}
