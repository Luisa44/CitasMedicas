import 'package:app/features/auth/account-validation/account_validation.controller.dart';
import 'package:app/features/users/list/user_list.view.dart';
import 'package:app/utils/session/session.model.dart';
import '../../medical-appointments/list/medical_appointment_list.view.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
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
  Session? userSession;

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  loadUserInfo() async{
    userSession = Session.fromJson(await SessionManager().get('user_session'));
  }

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    String password = '';
    String passwordConfirm = '';
    ChangePassController controller = ChangePassController();
    controller.appendContext(context);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 80, bottom: 50),
        child: Form(
          key: _formKey,
          child: Column(children: [
            const Text('Cambio de Contraseña',
                style: TextStyle(color: Colors.blue, fontSize: 30)),
            const SizedBox(height: 50),
            TextFormField(
              onChanged: (value) => password = value,
              validator: (value) {
                if(value.toString().length < 6){
                  return 'La contraseña debe contener al menos 6 caracteres';
                }
              },
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
            TextFormField(
              onChanged: (value) => passwordConfirm = value,
              validator: (value){
                if(value == ''){
                  return 'Este campo es requerido';
                }

                if(password != passwordConfirm){
                  return 'Las contraseñas no coinciden';
                }
              },
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var changed = await controller.changePassword(password);
                    if(changed){
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Contraseña Actualizada'),
                          content: const Text('La contraseña fue cambiada con exito.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context, 'OK');
                                
                                if(userSession?.role == 'administrator'){
                                  Navigator.pushNamed(context!, UserListPage.routeName);
                                }else if(userSession?.role == 'doctor' || userSession?.role == 'patient'){
                                  Navigator.pushNamed(context!, MedicalAppointmentListPage.routeName);
                                }
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Guardar')),
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
              child: const Text('Cancelar')
            )
          ]),
        )
    ));
  }
}
