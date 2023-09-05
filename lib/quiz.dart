import 'package:flutter/material.dart';

import 'package:quiz_app/questions_screen.dart';
import './start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import './results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  //late Widget activeScreen;

  /*@override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }*/

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chosenAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chosenAnswer,
      );
    }

    if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
            screenWidget, /*activeScreen == "start-screen"
            ? StartScreen(switchScreen)
            : const QuestionsScreen(),*/
        //activeScreen,
      ),
    );
  }
}
