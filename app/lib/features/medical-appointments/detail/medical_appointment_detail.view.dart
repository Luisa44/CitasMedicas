import 'package:flutter/material.dart';

class MedicalAppointmentDetailPage extends StatefulWidget {
  const MedicalAppointmentDetailPage({super.key});

  static String routeName = '/medical-appointments/detail';
  // This widget is the root of your application.
  @override
  State<MedicalAppointmentDetailPage> createState() => _MedicalAppointmentDetailPage();
}

class _MedicalAppointmentDetailPage extends State<MedicalAppointmentDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('Medical Appointment Detail Page'));
  }
}
