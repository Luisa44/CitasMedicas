import 'package:app/features/medical-appointments/doctor-programer/medical_appointment_doctor_programer.model.dart';
import 'package:app/features/medical-appointments/doctor-programer/medical_appointment_doctor_programer.service.dart';
import 'package:flutter/material.dart';

class MedicalAppointmentPrgramerController {
  BuildContext? context;
  MedicalAppointmentProgramerService service = MedicalAppointmentProgramerService();

  appendContext(BuildContext context){
    context = context;
  }

  Future<bool> save(MedicalAppointment data){
    return service.save(data);
  }

  Future<List<Headquarter>> getAllHeadquarters(){
    return service.getAllHeadquarters();
  }
}
