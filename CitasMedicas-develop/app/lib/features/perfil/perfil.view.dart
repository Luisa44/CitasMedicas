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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil'),
          leading: const BackButton(),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            alignment: Alignment.center,
            child: Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/user_woman_2.png'),
                ),
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
            child: Form(
                child: Column(
              children: [
                const Text('Nombres:'),
                const SizedBox(height: 5),
                TextField(
                    onChanged: (value) => {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Nombres')),
                const SizedBox(height: 30),
                const Text('Apellidos:'),
                const SizedBox(height: 5),
                TextField(
                    onChanged: (value) => {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(height: 30),
                const Text('Documento:'),
                const SizedBox(height: 5),
                TextField(
                    onChanged: (value) => {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Documento')),
                const SizedBox(height: 30),
                const Text('Correo:'),
                const SizedBox(height: 5),
                TextField(
                    onChanged: (value) => {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Correo')),
                const SizedBox(height: 30),
                const Text('Celular:'),
                const SizedBox(height: 5),
                TextField(
                    onChanged: (value) => {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Celular')),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: const Text('Cambios Guardados'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          )
                        ],
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text('Guardar'),
                )
              ],
            )),
          )
        ])));
  }
}
