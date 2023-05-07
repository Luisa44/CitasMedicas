import 'package:app/features/auth/account-validation/account_validation.service.dart';
import 'package:app/features/auth/account-validation/account_validation.model.dart';
import 'package:flutter/material.dart';

class ChangePassController {
  BuildContext? context;
  ChangePassService service = ChangePassService();

  appendContext(BuildContext context){
    context = context;
  }

  Future<bool> changePassword(String password) async {
    return service.changePassword(ChangePass(password: password));
  }
}
