import './user_list.service.dart';
import 'package:flutter/material.dart';
import './user_list.model.dart';

class UserController {
  BuildContext? context;
  UserService service = UserService();

  appendContext(BuildContext context){
    context = context;
  }

  Future<List<User>> getAll() async {
    return service.getAll();
  }

  Future<bool> deleteOne(User user){
    return service.deteleOne(user.id ?? 0);
  }
}
