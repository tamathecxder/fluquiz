import 'package:advance_basics_app/screens/questions_screen.dart';
import 'package:advance_basics_app/screens/start_screen.dart';
import 'package:flutter/material.dart';

class QuizScreenWidget extends StatefulWidget {
  const QuizScreenWidget({super.key});

  @override
  State<QuizScreenWidget> createState() => _QuizScreenWidgetState();
}

class _QuizScreenWidgetState extends State<QuizScreenWidget> {
  var activeScreen = const StartScreen();

  onSwitchScreen() => {
    setState(() {
      activeScreen = QuestionScreen();
    })
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: StartScreen(),
      ),
    );
  }
}
