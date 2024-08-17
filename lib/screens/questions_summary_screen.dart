import 'package:flutter/material.dart';

class QuestionsSummaryScreen extends StatelessWidget {
  const QuestionsSummaryScreen(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            String number = data["question_index"].toString();
            String question = data["question"].toString();
            String userAnswer = data["user_answer"].toString();
            String correctAnswer = data["correct_answer"].toString();

            return Row(
              children: [
                Text(number),
                Expanded(
                  child: Column(
                    children: [
                      Text(question),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(userAnswer),
                      Text(correctAnswer),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
