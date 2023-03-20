import 'package:flutter/material.dart';

class MedicalAppointmentListPage extends StatefulWidget {
  const MedicalAppointmentListPage({super.key});

  static String routeName = '/medical-appointments';
  // This widget is the root of your application.
  @override
  State<MedicalAppointmentListPage> createState() => _MedicalAppointmentListPage();
}

class _MedicalAppointmentListPage extends State<MedicalAppointmentListPage> {
  List<String> items = List<String>.generate(15, (i) => 'item ${i}');

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
              child: Text('Header')
            ),
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
        )
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Title ${index}'),
                    subtitle: Text('description ${index}'),
                    leading: Icon(Icons.calendar_today_rounded),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => {}, 
                        child: Icon(Icons.remove_red_eye),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () => {}, 
                        child: Icon(Icons.delete),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                      ),
                      const SizedBox(width: 20),
                    ]
                  ),
                  const SizedBox(height: 5)
                ]
              ),
            );
          }
        ),
    );
  }
}
