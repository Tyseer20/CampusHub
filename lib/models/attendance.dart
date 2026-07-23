class Attendance {
  final String subject;
  final int attended;
  final int total;

  const Attendance({
    required this.subject,
    required this.attended,
    required this.total,
  });

  double get percentage => (attended / total) * 100;
}
