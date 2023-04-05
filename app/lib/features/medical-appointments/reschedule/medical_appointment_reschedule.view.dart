import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../list/medical_appointment_list.model.dart';
import '../detail/medical_appointment_detail.view.dart';

class MedicalAppointmentReschedulePage extends StatefulWidget {
  const MedicalAppointmentReschedulePage({super.key});

  static String routeName = '/medical-appointments/reschedule';
  // This widget is the root of your application.
  @override
  State<MedicalAppointmentReschedulePage> createState() =>
      _MedicalAppointmentReschedulePage();
}

class _MedicalAppointmentReschedulePage extends State<MedicalAppointmentReschedulePage> {
  List<MedicalAppointment> items = List<MedicalAppointment>.generate(15, (i) {
    return MedicalAppointment(
        title: 'title ${i}',
        description: 'description ${i}',
        doctor: 'doctor${i}',
        date: DateTime.now());
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reprogramacion'),
        leading: const BackButton(),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0)
            ),
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                children: [
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
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 100.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/doctor_2.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Color.fromARGB(255, 82, 82, 82)),
                                children: [
                                  const TextSpan(
                                    text: 'Doctor: ', 
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                  TextSpan(text: items[index].doctor)
                                ]
                              )
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Color.fromARGB(255, 82, 82, 82)),
                                children: [
                                  const TextSpan(
                                    text: 'Especialidad: ', 
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                  TextSpan(text: items[index].doctor)
                                ]
                              )
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Color.fromARGB(255, 82, 82, 82)),
                                children: [
                                  const TextSpan(
                                    text: 'Sede: ', 
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
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
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Usuario Activado / Contraseña Cambiada'),
                                  content: const Text('El usuario fue activado con exito / La contraseña fue cambiada con exito'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'OK');
                                        Navigator.pushNamed(context, MedicalAppointmentDetailPage.routeName);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size.fromHeight(45),
                              backgroundColor: Colors.blue[400],
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                  bottomRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                )
                              )
                            ),
                            child: const Text('Seleccionar'),
                          )
                        ),
                      ]
                    ),
                  ),
                  const SizedBox(height: 5)
                ]
              ),
            )
          );
        }
      ),
    );
  }
}
