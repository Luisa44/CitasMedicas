import 'package:app/features/users/list/user_list.model.dart';
import 'package:app/features/users/edit/user_edit.model.dart';
import './user_edit.service.dart';
import 'package:flutter/material.dart';

class UserEditController {
  BuildContext? context;
  UserEditService service = UserEditService();

  appendContext(BuildContext context){
    context = context;
  }

  Future<List<Speciality>> getAll() async {
    return service.getAllSpecialities();
  }

  Future<bool> save(User data){
    return service.save(data);
  }
}
