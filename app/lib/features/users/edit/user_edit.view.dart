import 'package:flutter/material.dart';

class UserEditPage extends StatefulWidget {
  const UserEditPage({super.key});

  static String routeName = '/doctors/edit';
  // This widget is the root of your application.
  @override
  State<UserEditPage> createState() => _UserEditPage();
}

enum SingingCharacter { Doctor, Administrador }

class _UserEditPage extends State<UserEditPage> {
  SingingCharacter? _character = SingingCharacter.Administrador;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Header')),
          ],
        )),
        body: Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
            child: Form(
                child: Column(
              children: [
                const Text('Registro de Usuario', style: TextStyle(color: Colors.blue, fontSize: 30)),
                const SizedBox(height: 30),
                TextField(
                    onChanged: (value) => {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Nombres')),
                const SizedBox(height: 20),
                TextField(
                    onChanged: (value) => {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Apellidos')),
                const SizedBox(height: 20),
                TextField(
                    onChanged: (value) => {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Correo')),
                const SizedBox(height: 20),
                TextField(
                    onChanged: (value) => {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Documento')),
                const SizedBox(height: 20),
                TextField(
                    onChanged: (value) => {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Fecha de nacimiento')),
                const SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    const Text('Seleccione el rol:',style: TextStyle(fontSize: 15)),
                    const Divider(),
                    ListTile(
                      title: const Text('Administrador'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Administrador,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Doctor'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Doctor,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height:30),
                    ElevatedButton(
                      onPressed: () => {},
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Guardar')),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        side: const BorderSide(width: 2.0, color: Colors.blue),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Cancelar'))
                  ],
                )
              ],
            ))));
  }
}
