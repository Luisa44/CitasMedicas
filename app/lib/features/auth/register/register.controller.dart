import 'package:flutter/material.dart';
import 'register.model.dart';
import 'register.service.dart';

class RegisterController {
  final RegisterService _userService = RegisterService();

  Future<bool> registerUser(Register register) async {
    return _userService.registerUser(register);
  }
}
