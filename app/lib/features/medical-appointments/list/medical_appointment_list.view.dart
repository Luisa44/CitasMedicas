import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './medical_appointment_list.model.dart';

class MedicalAppointmentListPage extends StatefulWidget {
  const MedicalAppointmentListPage({super.key});

  static String routeName = '/medical-appointments';
  // This widget is the root of your application.
  @override
  State<MedicalAppointmentListPage> createState() =>
      _MedicalAppointmentListPage();
}

class _MedicalAppointmentListPage extends State<MedicalAppointmentListPage> {
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
      appBar: AppBar(title: Text('Citas Medicas')),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Header')),
          ListTile(
            title: const Text('Citas Medicas'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Programar Cita'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Historial de Citas'),
            onTap: () {},
          ),
        ],
      )),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
                padding: EdgeInsets.only(bottom: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(children: [
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0))),
                      title: Text('Cita medica'),
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
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 100.0,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/medical_appoinment_icon.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(items[index].title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 82, 82, 82))),
                                  RichText(
                                      text: TextSpan(
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 82, 82, 82)),
                                          children: [
                                        const TextSpan(text: 'Doctor: '),
                                        TextSpan(text: items[index].doctor)
                                      ]))
                                ]))
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
                                  onPressed: () => {},
                                  style: OutlinedButton.styleFrom(
                                      minimumSize: const Size.fromHeight(45),
                                      backgroundColor: Colors.blue[400],
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                        bottomRight: Radius.circular(12.0),
                                        bottomLeft: Radius.circular(30.0),
                                      ))),
                                  child: const Text('Detalle'),
                                )),
                            const SizedBox(width: 8),
                            Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                    onPressed: () => {},
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
                                    child: Text('Cancelar')))
                          ]),
                    ),
                    const SizedBox(height: 5)
                  ]),
                )) /*)*/;
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xfffea613),
          child: const Icon(Icons.add)
      )
    );
  }
}
