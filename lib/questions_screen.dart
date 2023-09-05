import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/answer_button.dart';
import './data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer,});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);

    setState(() {
      //currentQuestionIndex = currentQuestionIndex + 1;
      //currentQuestionIndex += 1;
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade300,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.bebasNeue(
                  color: const Color.fromARGB(255, 230, 201, 248),
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...currentQuestion.getShuffledAnswers().map(
                (answer) {
                  return AnswerButton(
                    answerText: answer,
                    onTap: (){
                      answerQuestion(answer);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
