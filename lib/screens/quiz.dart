import 'package:advance_basics_app/data/questions.dart';
import 'package:advance_basics_app/screens/questions_screen.dart';
import 'package:advance_basics_app/screens/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void handleSwitchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void handleChooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'start-screen';
        selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentWidget = activeScreen == 'start-screen'
        ? StartScreen(handleSwitchScreen)
        : QuestionsScreen(
            onChooseAnswer: handleChooseAnswer,
          );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.shade800,
                Colors.deepPurple.shade400,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentWidget,
        ),
      ),
    );
  }
}
