class User{
  String name = '';
  String surname = '';
  String role = '';
  DateTime dateBirth = DateTime.now();
  String document = '';

  User({required this.name, required this.surname, required this.role, required this.dateBirth, required this.document});
}