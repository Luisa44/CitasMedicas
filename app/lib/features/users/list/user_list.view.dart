import 'package:flutter/material.dart';
import './user_list.model.dart';
import "dart:math";

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  static String routeName = '/doctors';
  // This widget is the root of your application.
  @override
  State<UserListPage> createState() => _UserListPage();
}

class _UserListPage extends State<UserListPage> {
  List<User> items = List<User>.generate(15, (i) {
    return User(
        name: 'Nombre ${i}',
        surname: 'Apellidos ${i}',
        role: ['Doctor', 'Administrador'][Random().nextInt(2)],
        dateBirth: DateTime.now(),
        document: '${i}464674879');
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Usuarios')),
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
        body: ListView.builder(
            itemCount: items.length,
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
                            image: items[index].role == 'Doctor'
                                ? AssetImage('assets/images/doctor_profile.png')
                                : AssetImage('assets/images/user_men.png'),
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
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 95, 95, 95)),
                                children: [
                                  const TextSpan(
                                      text: 'Nombre: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          '${items[index].name} ${items[index].surname}'),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 95, 95, 95)),
                                children: [
                                  const TextSpan(
                                      text: 'Rol: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: items[index].role),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 95, 95, 95)),
                                children: [
                                  const TextSpan(
                                      text: 'Documento: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: items[index].document),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () => {},
                                  child: Row(children: [
                                    Text('Detalle'),
                                    const SizedBox(width: 5.0),
                                    Icon(Icons.remove_red_eye)
                                  ]),
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () => {},
                                  child: Row(children: [
                                    Text('Eliminar'),
                                    const SizedBox(width: 5.0),
                                    Icon(Icons.delete)
                                  ]),
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );

              /*Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Title ${index}'),
                    subtitle: Text('description ${index}'),
                    leading: items[index].role == 'Doctor' ? 
                    Container(
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/images/doctor_profile.png', fit: BoxFit.cover),
                    ) : 
                    Container(
                      width: 150,
                      height: 150,
                      child: Image.asset('assets/images/user_men.png', fit: BoxFit.cover),
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => {}, 
                        child: Icon(Icons.remove_red_eye),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () => {}, 
                        child: Icon(Icons.delete),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                      ),
                      const SizedBox(width: 20),
                    ]
                  ),
                  const SizedBox(height: 5)
                ]
              ),
            );*/
            }));
  }
}
