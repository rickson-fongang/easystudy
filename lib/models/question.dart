import 'option.dart';
class Question {
  final String id;
  final String text;
  final List<Option> options;
  final String correctAnswer;

  Question({required this.id, required this.text, required this.options, required this.correctAnswer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      text: json['text'],
      options: (json['options'] as List).map((option) => Option.fromJson(option)).toList(),
      correctAnswer: json['correctAnswer'],
    );
  }
}
