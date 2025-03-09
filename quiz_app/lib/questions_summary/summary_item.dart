import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.data, {super.key});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor:
                data['user_answer'] == data['correct_answer']
                    ? Color.fromARGB(255, 150, 198, 241)
                    : Color.fromARGB(255, 249, 133, 241),
            radius: 15,
            child: Text(
              ((data['question_index'] as int) + 1).toString(),
              style: const TextStyle(
                color: Color.fromARGB(255, 22, 2, 56),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  data['user_answer'] as String,
                  style: const TextStyle(
                    color: Color.fromARGB(240, 230, 200, 253),
                  ),
                ),
                Text(
                  data['correct_answer'] as String,
                  style: const TextStyle(color: Colors.lightGreenAccent),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
