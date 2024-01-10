import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.65,
              height: MediaQuery.of(context).size.height*0.65,
              child: Image.asset('assets/images/flutter.png')),
          OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.start),
              label: const Text('Start Quiz'))
        ],
      ),
    ));
  }
}
