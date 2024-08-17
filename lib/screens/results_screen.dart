import 'package:advance_basics_app/data/questions.dart';
import 'package:advance_basics_app/screens/questions_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestartQuiz,
  });

  final void Function() onRestartQuiz;

  final List<String> chosenAnswers;

  List<Map<String, Object>> get summary {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers.first,
        "user_answer": chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final int totalQuestions = questions.length;
    final int totalCorrectQuestions = summary
        .where(
            (question) => question["user_answer"] == question["correct_answer"])
        .length;
    final String information =
        "You got $totalCorrectQuestions out of $totalQuestions questions correct!";

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              information,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionsSummaryScreen(summary),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: onRestartQuiz,
              icon: const Icon(Icons.refresh),
              label: const Text(
                'Restart Quiz',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
