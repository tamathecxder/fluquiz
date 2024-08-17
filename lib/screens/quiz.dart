import 'package:advance_basics_app/data/questions.dart';
import 'package:advance_basics_app/screens/questions_screen.dart';
import 'package:advance_basics_app/screens/results_screen.dart';
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
      activeScreen = 'questions-screen';
    });
  }

  void handleChooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentWidget;

    switch (activeScreen) {
      case 'start-screen':
        currentWidget = StartScreen(handleSwitchScreen);
        break;
      case 'questions-screen':
        currentWidget = QuestionsScreen(
          onChooseAnswer: handleChooseAnswer,
        );
        break;
      case 'results-screen':
        currentWidget = ResultsScreen(
          chosenAnswers: selectedAnswers,
        );
        break;
      default:
        currentWidget = StartScreen(handleSwitchScreen);
        break;
    }

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
