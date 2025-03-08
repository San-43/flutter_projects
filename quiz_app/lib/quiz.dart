import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';

import 'home_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'home_page';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 39, 1, 104),
                Color.fromARGB(255, 132, 38, 220),
              ],
            ),
          ),
          child:
              activeScreen == 'home_page'
                  ? HomePage(switchScreen)
                  : QuestionsScreen(),
        ),
      ),
    );
  }
}
