import 'package:app/constants/app_constants.dart';
import 'package:app/features/users/edit/user_edit.model.dart';
import 'package:app/features/users/list/user_list.model.dart';
import 'package:flutter/material.dart';
import './user_edit.controller.dart';

class UserEditPage extends StatefulWidget {
  const UserEditPage({super.key});

  static String routeName = '/doctors/edit';
  // This widget is the root of your application.
  @override
  State<UserEditPage> createState() => _UserEditPage();
}

enum RolesAvailable { Doctor, Administrador }

class _UserEditPage extends State<UserEditPage> {
  final _formKey = GlobalKey<FormState>();
  RolesAvailable? _role = RolesAvailable.Administrador;
  List<DropdownMenuEntry<Speciality>> specialitiesEntry = List.empty(growable: true);
  UserEditController controller = UserEditController();

  @override
  void initState() {
    super.initState();
    getSpecialities();
  }

  getSpecialities() async {
    List<Speciality> dataList = await controller.getAll();

    setState(() {
      for(Speciality item in dataList){
        specialitiesEntry.add(DropdownMenuEntry<Speciality>(value: item, label: item.description ?? ''));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    controller.appendContext(context);
    var user = ModalRoute.of(context)!.settings.arguments as User?;
    Speciality specSelected = Speciality();

    bool isEditing = false;

    if(user != null){
      var speciality = specialitiesEntry.singleWhere((element) {
        if(element.value.id == user?.speciality){
          return true;
        }
        return false;
      }, orElse: () => DropdownMenuEntry(value: Speciality(), label: ''));
      specSelected = speciality.value;
      
      setState(() {
        if(user?.role == 'Administrador'){
          _role = RolesAvailable.Administrador;
        }else{
          _role = RolesAvailable.Doctor;
        }
      });
      isEditing = true;
    }else{
      user = User(role: 'Administrador');
    }

    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
            child: Form(
                key: _formKey,
                child: Column(
                children: [
                  const Text('Registro de Usuario', style: TextStyle(color: Colors.blue, fontSize: 30)),
                  const SizedBox(height: 30),
                  TextFormField(
                      validator: (value) {
                        if(value == ''){
                          return 'Este campo es requerido';
                        }
                      },
                      controller: TextEditingController(text: user.name ?? '' ),
                      onChanged: (value) => {user?.name = value},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Nombres')),
                  const SizedBox(height: 20),
                  TextFormField(
                      validator: (value){
                        if(value == ''){
                          return 'Este campo es requerido';
                        }
                      },
                      controller: TextEditingController(text: user.surname ?? '' ),
                      onChanged: (value) => {user?.surname = value},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Apellidos')),
                  const SizedBox(height: 20),
                  TextFormField(
                      validator: (value){
                        if(value == ''){
                          return 'Este campo es requerido';
                        }

                        if(!regexEmail.hasMatch(value ?? '')){
                          return 'Debe ingresar un correo valido';
                        }
                      },
                      readOnly: isEditing,
                      controller: TextEditingController(text: user.email ?? '' ),
                      onChanged: (value) => {user?.email = value},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Correo')),
                  const SizedBox(height: 20),
                  TextFormField(
                      validator: (value){
                        if(value == ''){
                          return 'Este campo es requerido';
                        }
                      },
                      controller: TextEditingController(text: user.identification ?? '' ),
                      onChanged: (value) => {user?.identification = value},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Documento')),
                  const SizedBox(height: 20),
                  TextFormField(
                      validator: (value){
                        if(value == ''){
                          return 'Este campo es requerido';
                        }
                      },
                      controller: TextEditingController(text: user.phone ?? '' ),
                      onChanged: (value) => {user?.phone = value},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Celular')),
                  const SizedBox(height: 20),
                  TextFormField(
                      validator: (value){
                        if(value == ''){
                          return 'Este campo es requerido';
                        }
                      },
                      controller: TextEditingController(text: user.address ?? '' ),
                      onChanged: (value) => {user?.address = value},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Dirección')),
                  const SizedBox(height: 20),
                  (_role == RolesAvailable.Doctor) ? DropdownMenu(
                    initialSelection: specSelected,
                    onSelected: (value) => { user?.speciality = value?.id },
                    dropdownMenuEntries: specialitiesEntry,
                    hintText: 'Especialidad',
                    inputDecorationTheme: InputDecorationTheme(
                      constraints: const BoxConstraints(maxWidth: 350),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ) : const SizedBox(height: 0),
                  const SizedBox(height: 20),
                  Column(
                    children: <Widget>[
                      const Text('Seleccione el rol:',style: TextStyle(fontSize: 15)),
                      const Divider(),
                      ListTile(
                        title: const Text('Administrador'),
                        leading: Radio<RolesAvailable>(
                          value: RolesAvailable.Administrador,
                          groupValue: _role,
                          onChanged: (RolesAvailable? value) {
                            user?.role = 'Administrador';
                            setState(() {
                              _role = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Doctor'),
                        leading: Radio<RolesAvailable>(
                          value: RolesAvailable.Doctor,
                          groupValue: _role,
                          onChanged: (RolesAvailable? value) {
                            user?.role = 'Doctor';
                            setState(() {
                              _role = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height:30),
                      ElevatedButton(
                        onPressed: () async {
                          if(_formKey.currentState!.validate()){
                            bool isSaved = await controller.save(user!);
                            if(isSaved) {
                              Navigator.pop(context);
                            }
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text('Guardar')),
                  ],
                )
              ],
            )
          )
        )
      )
    );
  }
}
