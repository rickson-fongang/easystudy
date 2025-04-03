import 'package:flutter/material.dart';

class StudyModePage extends StatefulWidget {
  const StudyModePage({super.key});

  @override
  _StudyModePageState createState() => _StudyModePageState();
}

class _StudyModePageState extends State<StudyModePage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is 2 + 2?',
      'answer': '4',
      'understood': false,
    },
    {
      'question': 'What is the chemical symbol for water?',
      'answer': 'H2O',
      'understood': false,
    },
    {
      'question': 'Who was the first president of the USA?',
      'answer': 'George Washington',
      'understood': false,
    },
    {
      'question': 'Translate "Hello" to French.',
      'answer': 'Bonjour',
      'understood': false,
    },
  ];

  int currentIndex = 0;

  void _markAsUnderstood() {
    setState(() {
      questions[currentIndex]['understood'] = true;
    });
  }

  void _markForReview() {
    setState(() {
      questions[currentIndex]['understood'] = false;
    });
  }

  void _nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _previousQuestion() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Study Mode'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Question Text
            Text(
              currentQuestion['question'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Answer Text
            Text(
              'Answer: ${currentQuestion['answer']}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Mark as Understood or Review Later
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _markAsUnderstood,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text('Mark as Understood'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _markForReview,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text('Review Later'),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _previousQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                  ),
                  child: Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                  ),
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}