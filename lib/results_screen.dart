import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import './questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correctAnswer": questions[i].answers[0],
        "user_answer": chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 148, 116, 203),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("List of a and qs"),
              const SizedBox(height: 30),
              QuestionsSummary(getSummaryData()),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                child: const Text("Restart quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
