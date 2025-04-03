class StudySession {
  final String id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;

  StudySession({required this.id, required this.title, required this.description, required this.startDate, required this.endDate});

  factory StudySession.fromJson(Map<String, dynamic> json) {
    return StudySession(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }
}
