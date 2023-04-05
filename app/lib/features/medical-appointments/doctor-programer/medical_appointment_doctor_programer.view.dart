import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import '../list/medical_appointment_list.view.dart';

class MedicalAppointmentDocProgramerPage extends StatefulWidget {
  const MedicalAppointmentDocProgramerPage({super.key});

  static String routeName = '/medical-appointments/doctor/edit';
  // This widget is the root of your application.
  @override
  State<MedicalAppointmentDocProgramerPage> createState() => _MedicalAppointmentDocProgramerPage();
}

class _MedicalAppointmentDocProgramerPage extends State<MedicalAppointmentDocProgramerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programar Cita'),
        leading: const BackButton(),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) => {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: 'Procedimiento'
                )
              ),
              const SizedBox(height: 15),
              DateTimeField(
                onDateSelected: (value){}, 
                selectedDate: DateTime.now(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                onChanged: (value) => {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: 'Obervaciones'
                )
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                  context, 
                  MedicalAppointmentListPage.routeName, 
                  arguments: 'doctor@example.com'
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Guardar')
              )
            ]
          )
        )
      ),
    );
  }
}