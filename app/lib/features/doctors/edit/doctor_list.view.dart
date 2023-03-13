import 'package:flutter/material.dart';

class DoctorEditPage extends StatefulWidget {
  const DoctorEditPage({super.key});

  static String routeName = '/doctors/edit';
  // This widget is the root of your application.
  @override
  State<DoctorEditPage> createState() => _DoctorEditPage();
}

class _DoctorEditPage extends State<DoctorEditPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('Doctor Edit Page'));
  }
}
