import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.starQuiz,{super.key});

  final void Function() starQuiz;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            height: 300,
            color: Color.fromARGB(160, 255, 255, 255),
          ),
          SizedBox(height: 60),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.tangerine(fontSize: 45, color: Colors.white),
          ),
          SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: starQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
              size: 30,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
