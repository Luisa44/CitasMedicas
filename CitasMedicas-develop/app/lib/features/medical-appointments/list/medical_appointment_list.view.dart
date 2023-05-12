import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './medical_appointment_list.model.dart';
import '../detail/medical_appointment_detail.view.dart';
import '../edit/medical_appointment_edit.view.dart';
import '../doctor-programer/medical_appointment_doctor_programer.view.dart';
import '../../auth/login/login.view.dart';
import '../../perfil/perfil.view.dart';
import "dart:math";

class MedicalAppointmentListPage extends StatefulWidget {
  const MedicalAppointmentListPage({super.key});

  static String routeName = '/medical-appointments';
  // This widget is the root of your application.
  @override
  State<MedicalAppointmentListPage> createState() =>
      _MedicalAppointmentListPage();
}

var _random = new Random();
List<String> status = ['Activo', 'Cancelada', 'Asistido'];

class _MedicalAppointmentListPage extends State<MedicalAppointmentListPage> {

  @override
  Widget build(BuildContext context) {
    final emailUser = ModalRoute.of(context)!.settings.arguments;
    print(emailUser);

    List<MedicalAppointment> items = List<MedicalAppointment>.generate(15, (i) {
      return MedicalAppointment(
          title: 'title ${i}',
          description: 'description ${i}',
          doctor: emailUser == 'doctor@example.com' ? 'paciente ${i}' : 'doctor ${i}' ,
          date: DateTime.now(),
          state: status[_random.nextInt(status.length)]
        );
      }
    );

    return Scaffold(
      appBar: AppBar(title: Text('Citas Medicas - ${emailUser == 'doctor@example.com' ? 'Doctor' : 'Paciente'}')),
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
            title: const Text('Citas Medicas'),
            onTap: () {
              Navigator.pushNamed(context, MedicalAppointmentListPage.routeName);
            },
          ),
          ListTile(
            title: const Text('Programar Cita'),
            onTap: () {
              if(emailUser == 'doctor@example.com'){
                Navigator.pushNamed(context, MedicalAppointmentDocProgramerPage.routeName);
              }else{
                Navigator.pushNamed(context, MedicalAppointmentEditPage.routeName);
              }
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
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                      child: const Text('Si'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('No'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      )),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
                padding: const EdgeInsets.only(bottom: 10),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: Column(children: [
                    ListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0))),
                      title: const Text('Cita medica'),
                      subtitle: Row(children: [
                        const Icon(Icons.schedule, color: Colors.white),
                        const SizedBox(width: 5),
                        Text(DateFormat.yMMMd()
                            .add_Hm()
                            .format(items[index].date))
                      ]),
                      tileColor: Colors.blue[400],
                      textColor: Colors.white,
                      trailing: Icon( 
                        items[index].state == 'Activo' ? Icons.check_circle_outline : (items[index].state == 'Cancelada' ? Icons.remove_circle_outline: Icons.stop_circle_outlined),
                        color: items[index].state == 'Asistido' ? Colors.white54 : Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 100.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/medical_appoinment_icon.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(items[index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 82, 82, 82)
                                )
                              ),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 82, 82, 82)),
                                  children: [
                                    TextSpan(text: emailUser == 'doctor@example.com' ? 'Paciente: ' : 'Doctor: '),
                                    TextSpan(text: items[index].doctor)
                                  ]
                                )
                              )
                            ]
                          )
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                flex: 2,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if(emailUser == 'doctor@example.com'){
                                      Navigator.pushNamed(context, MedicalAppointmentDocProgramerPage.routeName);
                                    }else{
                                      Navigator.pushNamed(context, MedicalAppointmentDetailPage.routeName);
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                      minimumSize: const Size.fromHeight(45),
                                      backgroundColor: Colors.blue[400],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(12.0),
                                        topRight: const Radius.circular(12.0),
                                        bottomRight: Radius.circular( items[index].state != 'Asistido' ? 12.0 : 30.0),
                                        bottomLeft: const Radius.circular(30.0),
                                      ))),
                                  child: const Text('Detalle'),
                                )),
                            items[index].state != 'Asistido' ? const SizedBox(width: 8) : const SizedBox(width: 0),
                            items[index].state != 'Asistido' ? Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                    onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) => AlertDialog(
                                        title: const Text('Cancelar cita?'),
                                        content: Text('Esta seguro que quiere cancelar la cita \'${items[index].title}\'?'),
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
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: const Size.fromHeight(45),
                                      backgroundColor: const Color.fromARGB(
                                          211, 129, 129, 129),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                        bottomRight: Radius.circular(30.0),
                                        bottomLeft: Radius.circular(12.0),
                                      )),
                                    ),
                                    child: const Text('Cancelar'))): const SizedBox(width: 0)
                          ]),
                    ),
                    const SizedBox(height: 5)
                  ]),
                )) /*)*/;
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if(emailUser == 'doctor@example.com'){
              Navigator.pushNamed(context, MedicalAppointmentDocProgramerPage.routeName);
            }else{
              Navigator.pushNamed(context, MedicalAppointmentEditPage.routeName);
            }
          },
          backgroundColor: Color(0xfffea613),
          child: const Icon(Icons.add)
      )
    );
  }
}
