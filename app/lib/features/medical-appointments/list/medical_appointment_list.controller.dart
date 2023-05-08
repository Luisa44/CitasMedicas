import 'package:app/features/medical-appointments/doctor-programer/medical_appointment_doctor_programer.model.dart';
import 'package:app/features/medical-appointments/doctor-programer/medical_appointment_doctor_programer.view.dart';
import 'package:app/features/medical-appointments/list/medical_appointment_list.model.dart';
import 'package:app/features/medical-appointments/list/medical_appointment_list.service.dart';
import 'package:flutter/material.dart';

class MedicalAppointmentListController {
  BuildContext? context;
  MedicalAppointmentListService service = MedicalAppointmentListService();

  appendContext(BuildContext context){
    context = context;
  }

  Future<List<MedicalAppointmentDetail>> getAll(){
    return service.getAll();
  }

  navToEditDoctor(MedicalAppointmentDetail data, BuildContext context){
    MedicalAppointment medAppointment = MedicalAppointment(
      date: data.date,
      description: data.description,
      headquarter: data.headquarter?.id
    );
    Navigator.pushNamed(context!, MedicalAppointmentDocProgramerPage.routeName, arguments: medAppointment);
  }

  Future<bool> deleteOne(MedicalAppointmentDetail data){
    return service.deteleOne(data.id ?? 0);
  }
}
