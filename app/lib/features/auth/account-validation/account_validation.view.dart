import 'package:flutter/material.dart';

class AccountValidationPage extends StatefulWidget {
  const AccountValidationPage({super.key});

  static String routeName = '/account-validation';
  // This widget is the root of your application.
  @override
  State<AccountValidationPage> createState() => _AccountValidationPage();
}

class _AccountValidationPage extends State<AccountValidationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('Account Validation Page'));
  }
}
