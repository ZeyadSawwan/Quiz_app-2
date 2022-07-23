import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsContainer extends StatelessWidget {
  QuestionsContainer({required this.questionText, required this.index});
  String questionText;
  int index;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Text(
              "Q. ${index + 1}",
              style: GoogleFonts.lobster(fontSize: 20),
            ),
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.37,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60))),
        ),
      ],
    );
  }
}
