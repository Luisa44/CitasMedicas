import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../login/login.view.dart';
import 'register.controller.dart';
import 'register.model.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static String routeName = '/register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final UserController _userController = UserController();
  final TextEditingController _user_nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _user_nameController,
              decoration: InputDecoration(hintText: 'User Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextField(
              controller: _contrasenaController,
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _userController.registerUser(
                  context, _user_nameController.text, _emailController.text, _contrasenaController.text),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import '../login/login.view.dart';
// import 'register.controller.dart';
// import 'register.model.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   static String routeName = '/register';
//   // This widget is the root of your application.
//   @override
//   State<RegisterPage> createState() => _RegisterPage();
// }

// class _RegisterPage extends State<RegisterPage> {
//   bool _isObscure = true;

//   @override
//   Widget build(BuildContext context) {
//     UserController controller = new UserController();
//     Register register = new Register();
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SingleChildScrollView(
//             child: Container(
//           margin:
//               const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
//           child: Column(
//             children: [
//               const Text('Registro',
//                   style: TextStyle(color: Colors.blue, fontSize: 30)),
//               Image.asset('assets/images/login_2.png', cacheHeight: 300),
//               const SizedBox(height: 20),
//               TextField(
//                 onChanged: (value) => {register.user_name = value},
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   hintText: 'Nombre',
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 onChanged: (value) => {register.email = value},
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     hintText: 'Correo'),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 onChanged: (value) => {register.contrasena = value},
//                 obscureText: _isObscure,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     hintText: 'Contraseña',
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                           _isObscure ? Icons.visibility : Icons.visibility_off),
//                       onPressed: () => {
//                         setState(() {
//                           _isObscure = !_isObscure;
//                         })
//                       },
//                     )),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                   onPressed: () => {
//                     controller!.registerUser(register)
//                   },
//                   style: OutlinedButton.styleFrom(
//                     minimumSize: const Size.fromHeight(50),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                   child: Text('Registarse')),
//               const SizedBox(height: 12),
//               const Row(children: [
//                 Expanded(child: Divider(color: Colors.grey, height: 48)),
//                 const SizedBox(width: 10),
//                 Text('Ya tienes cuenta?',
//                     style:
//                         TextStyle(color: Color.fromARGB(255, 116, 116, 116))),
//                 const SizedBox(width: 10),
//                 Expanded(child: Divider(color: Colors.grey, height: 48)),
//               ]),
//               const SizedBox(height: 15),
//               OutlinedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, LoginPage.routeName);
//                   },
//                   style: OutlinedButton.styleFrom(
//                     minimumSize: const Size.fromHeight(50),
//                     side: const BorderSide(width: 2.0, color: Colors.blue),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                   child: const Text('Inciciar Sesión')),
//             ],
//           ),
//         )));
//   }
// }
