import 'package:app/features/users/list/user_list.controller.dart';
import 'package:app/utils/session/session.model.dart';
import 'package:flutter/material.dart';
import './user_list.model.dart';
import '../edit/user_edit.view.dart';
import '../../perfil/perfil.view.dart';
import '../../auth/login/login.view.dart';
import '../edit/user_edit.view.dart';
import "dart:math";
import 'package:flutter_session_manager/flutter_session_manager.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  static String routeName = '/doctors';
  // This widget is the root of your application.
  @override
  State<UserListPage> createState() => _UserListPage();
}

class _UserListPage extends State<UserListPage> {

  List<User> users = List.empty();
  UserController controller = UserController();

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  getUsers() async {
    var data = await controller.getAll();
    setState(() {
      users = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.appendContext(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Usuarios')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue, 
                image: DecorationImage(
                  image: AssetImage('assets/images/font.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, PerfilPage.routeName);
                      },
                      child: const Row(
                        children: [
                          Text(
                            'Daniela Mateo Camacho',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                          SizedBox(width: 5),
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/user_woman_2.png'),
                            radius: 30,
                          )
                        ]
                      ),
                    )
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Crear Usuario'),
              onTap: () {
                Navigator.pushNamed(context, UserEditPage.routeName);
              },
            ),
            ListTile(
              title: const Text('Cerrar Sesión'),
              onTap: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Cerrar Sesión'),
                    content: const Text('¿Desesa cerrar sesión?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () async {
                          await SessionManager().set('user_session', Session());
                          Navigator.pop(context, 'Cancel');
                          Navigator.pushNamed(context, LoginPage.routeName);
                        },
                        child: const Text('Si'),
                      ),
                      TextButton(
                        onPressed: () => {Navigator.pop(context, 'Cancel')},
                        child: const Text('No'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ]
        )
      ),
      body: Column(children: [
        const SizedBox(height: 7),
        TextField(
          decoration: InputDecoration(
            hintText: 'Buscar',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
            child: RefreshIndicator(
                onRefresh: () async{
                  await getUsers();
                },
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          // Imagen del usuario en la parte derecha del card
                          const SizedBox(width: 15),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: users[index].role == 'Medico'
                                      ? const AssetImage(
                                          'assets/images/doctor_profile.png')
                                      : const AssetImage(
                                          'assets/images/user_men.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          // Información del usuario en la parte izquierda del card
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 16.0, 16.0, 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 30),
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 95, 95, 95)),
                                      children: [
                                        const TextSpan(
                                            text: 'Nombre: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan( text: '${users[index].name} ${users[index].surname}' ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 95, 95, 95)),
                                      children: [
                                        const TextSpan(
                                            text: 'Rol: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: users[index].role),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 95, 95, 95)),
                                      children: [
                                        const TextSpan(
                                            text: 'Documento: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: users[index].identification),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () => {
                                            Navigator.pushNamed(context, UserEditPage.routeName, arguments: users[index])
                                          },
                                          style: OutlinedButton.styleFrom(
                                              backgroundColor: const Color.fromRGBO(
                                                  47, 137, 255, 0.612),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12))
                                          ),
                                          child: const Row(children: [
                                            Text('Detalle'),
                                            SizedBox(width: 5.0),
                                            Icon(Icons.remove_red_eye)
                                          ]),
                                        )
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: ElevatedButton(
                                        onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) => AlertDialog(
                                            title: const Text('Eliminar Usuario'),
                                            content: Text('Esta seguro que quiere eliminar el usuario \'${users[index].name}\'?'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                                child: const Text('No'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(context, 'OK'),
                                                child: const Text('Si'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        child: Row(children: [
                                          Text('Eliminar'),
                                          const SizedBox(width: 5.0),
                                          Icon(Icons.delete)
                                        ]),
                                        style: OutlinedButton.styleFrom(
                                            backgroundColor: Color.fromRGBO(
                                                255, 47, 47, 0.612),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12))),
                                      ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }))
        )
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, UserEditPage.routeName);
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add)),
    );
  }
}
