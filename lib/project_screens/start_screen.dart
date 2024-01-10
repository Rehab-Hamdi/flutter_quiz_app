import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/project_screens/quiz_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.65,
                child: Image.asset('assets/images/flutter.png')),
            OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    style: BorderStyle.solid,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => QuizScreen()));
                },
                icon: const Icon(
                  Icons.start,
                  size: 25,
                ),
                label: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: const Text(
                    'Start Quiz',
                    style: TextStyle(fontSize: 18),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
