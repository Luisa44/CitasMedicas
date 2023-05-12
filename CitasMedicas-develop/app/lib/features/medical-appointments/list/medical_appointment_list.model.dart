class MedicalAppointment {
  String doctor;
  DateTime date;
  String title;
  String description;
  String? state;

  MedicalAppointment({required this.title, this.description = '', required this.doctor, required this.date, this.state});
}