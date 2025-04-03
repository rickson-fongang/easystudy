import 'question.dart';

class Exam {
  final String id;
  final String title;
  final String description;
  final List<Question> questions;

  Exam({required this.id, required this.title, required this.description, required this.questions});

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      questions: (json['questions'] as List).map((question) => Question.fromJson(question)).toList(),
    );
  }
}
