import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummaryScreen extends StatelessWidget {
  const QuestionsSummaryScreen(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            print(data);
            int index = data["question_index"] as int;
            String number = (index + 1).toString();
            String question = data["question"].toString();
            String userAnswer = data["user_answer"].toString();
            String correctAnswer = data["correct_answer"].toString();
            bool isCorrectAnswer = userAnswer == correctAnswer;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 28,
                  width: 28,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCorrectAnswer
                        ? Colors.lightGreen[400]
                        : Colors.pink[200],
                  ),
                  child: Center(
                    child: Text(
                      number,
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        userAnswer,
                        style: GoogleFonts.lato(
                          color: Colors.white60,
                        ),
                      ),
                      Text(
                        correctAnswer,
                        style: GoogleFonts.lato(
                          color: Colors.lightGreenAccent,
                        ),
                      ),
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
