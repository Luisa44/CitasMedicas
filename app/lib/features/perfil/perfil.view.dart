import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  static String routeName = '/perfil';
  // This widget is the root of your application.
  @override
  State<PerfilPage> createState() => _PerfilPage();
}

class _PerfilPage extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('Perfil Page'));
  }
}
