import 'package:flutter/material.dart';
import 'package:questions_app/model/model.dart';

class Quiz1Bloc {
  String selectedAnswer = "";
  int index2 = 0;
  bool answered = false;
  PageController? pageController = PageController(initialPage: 0);
  int score = 0;
  List<QuizlModel> questionList() {
    List<QuizlModel> list = [];
    list.add(
      QuizlModel(
        correctAnswer: "20",
        question: "15 + 5 = ?",
        answers: [
          "1",
          "2",
          "20",
          "51",
        ],
      ),
    );
    list.add(QuizlModel(
      correctAnswer: "71",
      question: "50 + 21 = ?",
      answers: ["1", "50", "71", "103"],
    ));
    list.add(QuizlModel(
      correctAnswer: "151",
      question: "101 + 50 = ?",
      answers: ["151", "90", "154", "157"],
    ));
    list.add(QuizlModel(
      correctAnswer: "190",
      question: "118 + 72 = ?",
      answers: ["101", "200", "192", "190"],
    ));

    return list;
  }

  void scoreMethod(index) {
    if (selectedAnswer == questionList()[index].correctAnswer) {
      score += 1;
    }
  }
}
