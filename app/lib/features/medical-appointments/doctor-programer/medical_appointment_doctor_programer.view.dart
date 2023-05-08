import 'package:app/features/medical-appointments/doctor-programer/medical_appointment_doctor_programer.controller.dart';
import 'package:app/features/medical-appointments/doctor-programer/medical_appointment_doctor_programer.model.dart';
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

  List<DropdownMenuEntry<Headquarter>> headquartersEntry = List.empty(growable: true);
  MedicalAppointmentPrgramerController controller = MedicalAppointmentPrgramerController();

  @override
  void initState() {
    super.initState();
    getSpecialities();
  }

  getSpecialities() async {
    List<Headquarter> dataList = await controller.getAllHeadquarters();

    setState(() {
      for(Headquarter item in dataList){
        headquartersEntry.add(DropdownMenuEntry<Headquarter>(value: item, label: item.description ?? ''));
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    bool isEditing = false;
    final _formKey = GlobalKey<FormState>();
    var medAppointment = ModalRoute.of(context)!.settings.arguments as MedicalAppointment?;
    Headquarter headSelected = Headquarter();

    if(medAppointment != null){
      var speciality = headquartersEntry.singleWhere((element) {
        if(element.value.id == medAppointment?.headquarter){
          return true;
        }
        return false;
      }, orElse: () => DropdownMenuEntry(value: Headquarter(), label: ''));
      headSelected = speciality.value;
      
      isEditing = true;
    }else{
      medAppointment = MedicalAppointment();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Programar Cita'),
        leading: const BackButton(),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownMenu(
                initialSelection: headSelected,
                onSelected: (value) => { medAppointment?.headquarter = value?.id },
                dropdownMenuEntries: headquartersEntry,
                hintText: 'Sede',
                inputDecorationTheme: InputDecorationTheme(
                  constraints: const BoxConstraints(maxWidth: 350),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              const SizedBox(height: 15),
              DateTimeFormField(
                validator: (value){
                  if(value == null){
                    return 'Este campo es requerido';
                  }
                },
                initialValue: DateTime.parse(medAppointment.date ?? DateTime.now().toIso8601String()),
                onDateSelected: (value)=>{medAppointment?.date = value.toIso8601String()}, 
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: 'Fecha de Cita'
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                validator: (value){
                  if(value == ''){
                    return 'Este campo es requerido';
                  }
                },
                controller: TextEditingController(text: medAppointment.description ?? '' ),
                onChanged: (value) => {medAppointment?.description = value},
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: 'Descripción'
                )
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () async { 
                  if(_formKey.currentState!.validate()){
                    if(medAppointment?.headquarter == null){
                      return;
                    }

                    var isCreated = await controller.save(medAppointment!);
                    if(isCreated){
                      Navigator.pushNamed(context, MedicalAppointmentListPage.routeName);
                    }
                  }
                },
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