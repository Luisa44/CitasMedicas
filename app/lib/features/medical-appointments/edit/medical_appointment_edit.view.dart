import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:intl/intl.dart';
import '../list/medical_appointment_list.view.dart';

class MedicalAppointmentEditPage extends StatefulWidget {
  const MedicalAppointmentEditPage({super.key});

  static String routeName = '/medical-appointments/edit';
  // This widget is the root of your application.
  @override
  State<MedicalAppointmentEditPage> createState() => _MedicalAppointmentEditPage();
}

class _MedicalAppointmentEditPage extends State<MedicalAppointmentEditPage> {
  List<String> listItems = List.generate(8, (index) => 'item ${index}');
  final Map<String, List> _enabledAppointments = {
    'Juan Alberto': [
      {
        "sede": 'Laureles Altos',
        "hora": DateTime.now()
      },
      {
        "sede": 'Laureles Altos',
        "hora": DateTime.now()
      }
    ],
    'Maria Fernanda': [
        {
          "sede": 'Nueva Granada',
          "hora": DateTime.now()
        },
        {
          "sede": 'Laureles Altos',
          "hora": DateTime.now()
        }
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Citas Medicas'),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
              child: Column(
                children: [
                  const Text(
                    'Especialidad', 
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 0.80
                      ),
                    ),
                    child: DropdownButton(
                      hint: const Text('Seleccione una opción'),
                      items: listItems.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(), 
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Citas Disponibles',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ]
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GroupListView(
              sectionsCount: _enabledAppointments.keys.toList().length,
              countOfItemInSection: (int section) {
                return _enabledAppointments.values.toList()[section].length;
              },
              itemBuilder: (BuildContext context, IndexPath index) {
                return Container(
                  child: InkWell(
                    child: Card(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  color: Colors.black
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Fecha: ', 
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                  TextSpan(text:DateFormat.yMMMMd().format(_enabledAppointments.values.toList()[index.section][index.index]['hora']) )
                                ]
                              )
                            ),
                            const SizedBox(height: 6),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  color: Colors.black
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Hora: ', 
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                  TextSpan(text:DateFormat.jm().format(_enabledAppointments.values.toList()[index.section][index.index]['hora']) )
                                ]
                              )
                            ),
                            const SizedBox(height: 6),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  color: Colors.black
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Sede: ', 
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                  TextSpan(text: _enabledAppointments.values.toList()[index.section][index.index]['sede'] )
                                ]
                              )
                            ),
                          ]
                        ),
                      )
                    )
                  )
                );
              },
              groupHeaderBuilder: (BuildContext context, int section) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Text(
                    _enabledAppointments.keys.toList()[section],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              sectionSeparatorBuilder: (context, section) => const SizedBox(height: 10),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MedicalAppointmentListPage.routeName);
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Agendar Cita')),
            )
          )
        ]
      )
    );
  }
}
