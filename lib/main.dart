import 'package:advance_basics_app/screens/quiz_screen.dart';
import 'package:advance_basics_app/screens/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const QuizScreenWidget();
  }
}
