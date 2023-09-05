import 'package:flutter/material.dart';

import 'package:quiz_app/styled_text.dart';

// ignore: must_be_immutable
class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
 
  var startAlignment = Alignment.bottomLeft;
  var endAlignment = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: startAlignment,
            end: endAlignment,
            colors: const [
            Color.fromARGB(255, 136, 19, 152),
            Color.fromARGB(255, 85, 15, 108),
          ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              width: 250,
              color: const Color.fromARGB(150, 255, 254, 254),
            ),
            const SizedBox(
              height: 60,
            ),
            const StyledText(
              "Learn Flutter the fun way!",
            ),
            const SizedBox(
              height: 40,
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              onPressed: startQuiz,
              icon: const Icon(
                Icons.arrow_right_alt,
              ),
              label: const Text(
                "Start Quiz",
              ),
            ),
          ],
        ));
  }
}
