import 'package:flutter/material.dart';
import '../login/login.view.dart';

class ForgottenPasswordPage extends StatefulWidget {
  const ForgottenPasswordPage({super.key});

  static String routeName = '/forgotten-password';
  // This widget is the root of your application.
  @override
  State<ForgottenPasswordPage> createState() => _ForgottenPasswordPage();
}

class _ForgottenPasswordPage extends State<ForgottenPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 90, bottom: 50),
      child: Column(children: [
        const Text('Recuperar Contraseña',
            style: TextStyle(color: Colors.blue, fontSize: 30)),
        const SizedBox(height: 40),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Correo',
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
            onPressed: () => {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text('Recuperar')),
        const SizedBox(height: 20),
        const Row(children: [
          Expanded(child: Divider(color: Colors.grey, height: 48)),
          const SizedBox(width: 10),
          Text('Recuerdas tu contraseña?',
              style: TextStyle(color: Color.fromARGB(255, 116, 116, 116))),
          const SizedBox(width: 10),
          Expanded(child: Divider(color: Colors.grey, height: 48)),
        ]),
        const SizedBox(height: 20),
        OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginPage.routeName);
            },
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              side: const BorderSide(width: 2.0, color: Colors.blue),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Inciciar Sesión')),
      ]),
    ));
  }
}
