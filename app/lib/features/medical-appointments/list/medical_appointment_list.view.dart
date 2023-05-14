import 'package:app/features/medical-appointments/list/medical_appointment_list.controller.dart';
import 'package:app/utils/session/session.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../doctor-programer/medical_appointment_doctor_programer.view.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import '../detail/medical_appointment_detail.view.dart';
import '../edit/medical_appointment_edit.view.dart';
import './medical_appointment_list.model.dart';
import '../../auth/login/login.view.dart';
import '../../perfil/perfil.view.dart';
import 'package:intl/intl.dart';
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

  MedicalAppointmentListController controller = MedicalAppointmentListController();
  List<MedicalAppointmentDetail> medAppoitmentsList = List.empty();
  Session? userSession;

  @override
  void initState() {
    super.initState();
    loadUserInfo();
    getAll();
  }

  getAll() async{
    var medAppointments = await controller.getAll();
    setState(() {
      medAppoitmentsList = medAppointments;
    });
  }

  loadUserInfo() async{
    userSession = Session.fromJson(await SessionManager().get('user_session'));
  }

  @override
  Widget build(BuildContext context) {

    controller.appendContext(context);

    return Scaffold(
      appBar: AppBar(title:const Text('Citas Medicas')),
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
                    child: Row(
                      children: [
                        Text( userSession?.userName ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),
                        ),
                        const SizedBox(width: 5),
                        const CircleAvatar(
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
              if(userSession?.role == 'doctor'){
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
      body: RefreshIndicator(
          onRefresh: () async {
            await getAll();
          },
          child: ListView.builder(
            itemCount: medAppoitmentsList.length,
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
                              .format(DateTime.parse(medAppoitmentsList[index].date ?? '')))
                        ]),
                        tileColor: Colors.blue[400],
                        textColor: Colors.white,
                        trailing: Icon( 
                          medAppoitmentsList[index].state == 'Ocupada' ? Icons.check_circle_rounded : (medAppoitmentsList[index].state == 'Libre' ? Icons.remove_circle_outlined: Icons.stop_circle_rounded),
                          color: medAppoitmentsList[index].state == 'Atendida' ? Colors.green[400] : (medAppoitmentsList[index].state == 'Libre' ? Colors.orange[400]: Colors.blue[400]),
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
                                Text(medAppoitmentsList[index].description ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 82, 82, 82)
                                  )
                                ),
                                const SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 82, 82, 82)),
                                    children: [
                                      TextSpan(
                                        text: userSession?.role == 'doctor' ? 'Paciente: ' : 'Doctor: ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                      userSession?.role == 'doctor' ? 
                                        TextSpan(text: '${medAppoitmentsList[index].patient!.name ?? 'Sin paciente' } ')
                                      : TextSpan(text: '${medAppoitmentsList[index].doctor?.name} ${medAppoitmentsList[index].doctor?.surname}')
                                    ]
                                  )
                                ),
                                const SizedBox(height: 3),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 82, 82, 82)),
                                    children: [
                                      const TextSpan(
                                        text: 'Sede: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                      TextSpan(text: medAppoitmentsList[index].headquarter?.description)
                                    ]
                                  )
                                ),
                                const SizedBox(height: 3),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 82, 82, 82)),
                                    children: [
                                      const TextSpan(
                                        text: 'Dirección: ', 
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                      TextSpan(text: medAppoitmentsList[index].headquarter?.address)
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
                                      if(userSession?.role == 'doctor'){
                                        controller.navToEditDoctor(medAppoitmentsList[index], context);
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
                                          bottomRight: Radius.circular( medAppoitmentsList[index].state != 'Atendida' ? 12.0 : 30.0),
                                          bottomLeft: const Radius.circular(30.0),
                                        ))),
                                    child: const Text('Detalle'),
                                  )),
                              medAppoitmentsList[index].state != 'Atendida' ? const SizedBox(width: 8) : const SizedBox(width: 0),
                              medAppoitmentsList[index].state != 'Atendida' ? Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                      onPressed: () => showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          title: const Text('Cancelar cita?'),
                                          content: Text('Esta seguro que quiere cancelar la cita \"${medAppoitmentsList[index].description}\"?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, 'Cancel'),
                                              child: const Text('No'),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                var deleted = await controller.deleteOne(medAppoitmentsList[index]);
                                                if(deleted){
                                                  await getAll();
                                                  Navigator.pop(context, 'OK');
                                                }
                                              },
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
            })
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if(userSession?.role == 'doctor'){
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
