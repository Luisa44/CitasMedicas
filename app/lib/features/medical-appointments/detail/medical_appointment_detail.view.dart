import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../reschedule/medical_appointment_reschedule.view.dart';

class MedicalAppointmentDetailPage extends StatefulWidget {
  const MedicalAppointmentDetailPage({super.key});

  static String routeName = '/medical-appointments/detail';
  // This widget is the root of your application.
  @override
  State<MedicalAppointmentDetailPage> createState() => _MedicalAppointmentDetailPage();
}

class _MedicalAppointmentDetailPage extends State<MedicalAppointmentDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cita Medica'),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Fecha:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 3),
              const Text('Mauricio Alejandro Pedraza Gonzales'),
              const SizedBox(height: 15),
              const Text('Expecialidad:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 3),
              const Text('Cardiología'),
              const SizedBox(height: 15),
              const Text('Doctor:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 3),
              const Text('Juan Dario Avila Rodriguez'),
              const SizedBox(height: 15),
              const Text('Tipo Identificación:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 3),
              const Text('CC 45698563'),
              const SizedBox(height: 15),
              const Text('Telefono:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 3),
              const Text('3225698745'),
              const SizedBox(height: 15),
              const Text('Correo:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 3),
              const Text('juan.avila@example.com'),
              const SizedBox(height: 15),
              const Text('Sede:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 3),
              const Text('Teusaquillo'),
              const SizedBox(height: 15),
              const Text('Especialidad:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 3),
              const Text('Cardiologo'),
              const SizedBox(height: 15),
              const Text('Especialidad:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 3),
              const Text('Revision de la Orta'),
              const SizedBox(height: 25),
              Card(
                margin: const EdgeInsets.all(0),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Observaciones: ', 
                          style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        TextSpan(text: 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta)')
                      ]
                    )
                  ),
                ),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Reprogramar Cita'),
                      content: const Text('¿Esta seguro de reprogramar su cita medica?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'Cancel');
                            Navigator.pushNamed(context, MedicalAppointmentReschedulePage.routeName);
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
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                child: const Text('Reprogramar')
              )
            ],
          ),
        )
      )
    );
  }
}
