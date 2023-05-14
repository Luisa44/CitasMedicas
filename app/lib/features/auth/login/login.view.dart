import 'package:app/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../register/register.view.dart';
import '../forgotten-password/forgotten-password.view.dart';
import './login.controller.dart';
import './login.model.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _isObscure = true;
  LoginController? controller = null;
  Login login = Login();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    controller = LoginController(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Container(
          margin:
              const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text('Inicio de Sesión',
                    style: TextStyle(color: Colors.blue, fontSize: 30)),
                Image.asset('assets/images/login_2.png', cacheHeight: 330),
                const SizedBox(height: 20),
                TextFormField(
                    validator: (value) {
                      if(value == ''){
                        return 'Este campo es requerido';
                      }

                      if(!regexEmail.hasMatch(value ?? '')){
                        return 'Debe ingresar un correo valido';
                      }
                    },
                    onChanged: (value) => {login.email = value},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Correo')),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                      if(value == ''){
                        return 'Este campo es requerido';
                      }
                  },
                  onChanged: (value) => {login.contrasena = value},
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Contraseña',
                      suffixIcon: IconButton(
                        icon: Icon(
                            _isObscure ? Icons.visibility : Icons.visibility_off),
                        onPressed: () => {
                          setState(() {
                            _isObscure = !_isObscure;
                          })
                        },
                      )),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        bool isLogged = await controller!.signIn(login);
                        if (!isLogged) {
                          Toast.show(
                            'Usuario o contraseña incorrectos', 
                            duration: Toast.lengthLong, 
                            gravity: Toast.top, 
                            backgroundColor: Color.fromARGB(234, 255, 0, 0));
                        }
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text('Ingresar')),
                const SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text.rich(
                      TextSpan(
                          text: 'Ingresar con huella',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('nice');
                            }),
                      style: TextStyle(color: Color.fromARGB(255, 65, 65, 65))),
                  Text.rich(TextSpan(
                      text: 'Olvido su contraseña?',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                              context, ForgottenPasswordPage.routeName);
                        })),
                ]),
                const SizedBox(height: 20),
                const Row(children: [
                  Expanded(child: Divider(color: Colors.grey, height: 48)),
                  const SizedBox(width: 10),
                  Text('No tienes cuenta?',
                      style:
                          TextStyle(color: Color.fromARGB(255, 116, 116, 116))),
                  const SizedBox(width: 10),
                  Expanded(child: Divider(color: Colors.grey, height: 48)),
                ]),
                const SizedBox(height: 10),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterPage.routeName);
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      side: const BorderSide(width: 2.0, color: Colors.blue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Registrarse')),
              ],
            ),
          )
        )));
  }
}
