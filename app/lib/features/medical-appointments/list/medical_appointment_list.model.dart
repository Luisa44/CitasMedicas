class MedicalAppointment {
  String doctor;
  DateTime date;
  String title;
  String description;

  MedicalAppointment({required this.title, this.description = '', required this.doctor, required this.date});
}