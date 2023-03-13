import 'package:flutter/material.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});

  static String routeName = '/doctors';
  // This widget is the root of your application.
  @override
  State<DoctorListPage> createState() => _DoctorListPage();
}

class _DoctorListPage extends State<DoctorListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('Doctor List  Page'));
  }
}
