import 'package:app/features/auth/register/register.controller.dart';
import 'package:app/features/auth/register/register.model.dart';
import 'package:app/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../login/login.view.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static String routeName = '/register';
  // This widget is the root of your application.
  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();
  RegisterController controller = RegisterController();
  Register register = Register();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

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
                const Text('Registro',
                    style: TextStyle(color: Colors.blue, fontSize: 30)),
                Image.asset('assets/images/login_2.png', cacheHeight: 300),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if(value == ''){
                      return 'Este campo es requerido';
                    }
                  },
                  onChanged: (value) => register.userName = value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Nombre',
                  ),
                ),
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
                  onChanged: (value) => register.email = value,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Correo'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if(value == ''){
                      return 'Este campo es requerido';
                    }
                  },
                  onChanged: (value) => register.contrasena = value,
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
                        bool registered = await   controller.registerUser(register);
                        if(registered) {
                          setState((){
                            register.contrasena = ''; 
                            register.email = '';
                            register.userName = '';
                          });

                          Toast.show(
                            'Se ha registrado con exito', 
                            duration: Toast.lengthLong, 
                            gravity: Toast.bottom, 
                            backgroundColor: const Color.fromARGB(234, 145, 145, 145));
                        }
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Registarse')),
                const SizedBox(height: 12),
                const Row(children: [
                  Expanded(child: Divider(color: Colors.grey, height: 48)),
                  SizedBox(width: 10),
                  Text('Ya tienes cuenta?',
                      style:
                          TextStyle(color: Color.fromARGB(255, 116, 116, 116))),
                  SizedBox(width: 10),
                  Expanded(child: Divider(color: Colors.grey, height: 48)),
                ]),
                const SizedBox(height: 15),
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
              ],
            ),
          )
        )));
  }
}
