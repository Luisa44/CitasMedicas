import 'package:flutter/material.dart';
import '../login/login.view.dart';

class AccountValidationPage extends StatefulWidget {
  const AccountValidationPage({super.key});

  static String routeName = '/account-validation';
  // This widget is the root of your application.
  @override
  State<AccountValidationPage> createState() => _AccountValidationPage();
}

class _AccountValidationPage extends State<AccountValidationPage> {
  bool _isObscurePassword = true;
  bool _isObscureConPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 80, bottom: 50),
      child: Column(children: [
        const Text('Cambio de Contraseña',
            style: TextStyle(color: Colors.blue, fontSize: 30)),
        const SizedBox(height: 50),
        TextField(
          obscureText: _isObscurePassword,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: 'Nueva Contraseña',
              suffixIcon: IconButton(
                icon: Icon(_isObscurePassword
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () => {
                  setState(() {
                    _isObscurePassword = !_isObscurePassword;
                  })
                },
              )),
        ),
        const SizedBox(height: 15),
        TextField(
          obscureText: _isObscureConPassword,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: 'Confirma Contraseña',
              suffixIcon: IconButton(
                icon: Icon(_isObscureConPassword
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () => {
                  setState(() {
                    _isObscureConPassword = !_isObscureConPassword;
                  })
                },
              )),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
            onPressed: () => {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text('Guardar')),
        const SizedBox(height: 15),
        ElevatedButton(
            onPressed: () => {
              Navigator.pushNamed(context, LoginPage.routeName)
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text('Cancelar')),
      ]),
    ));
  }
}
