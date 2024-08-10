import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.onSwitchScreen, {super.key});

  final void Function() onSwitchScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.deepPurple.shade800,
          Colors.deepPurple.shade400,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Opacity(
              opacity: 0.9,
              child: Image.asset(
                'assets/images/quiz-logo.png',
                width: 250,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: onSwitchScreen,
              icon: const Icon(Icons.add),
              label: const Text(
                "Start Quiz",
              ),
            )
          ],
        ),
      ),
    );
  }
}
