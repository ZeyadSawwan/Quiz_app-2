import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:questions_app/screens/quiz1/quiz1.dart';
import 'package:questions_app/screens/result/result_bloc.dart';
import '../../shared/shared_widget.dart';
import '../home/home_screen.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(this.score, this.questionList, {Key? key}) : super(key: key);
  final int score;
  List questionList;
  // QuestionHiveModel questionHiveModel;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

var bloc = ResultBloc();

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 167, 178),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(60),
                child: Image.asset(
                  "assets/images/logo.png",
                  scale: 2,
                ),
              ),
              CircularPercentIndicator(
                radius: 42,
                lineWidth: 8,
                percent: widget.score / widget.questionList.length,
                center: Text(
                  "${bloc.calculateThePercentageOfCorrectAnswers(widget.questionList, widget.score)} %",
                  style: GoogleFonts.neuton(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87),
                ),
                progressColor: Colors.blue,
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                  width: 60,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blue)),
                  child: Text(
                    "${widget.score}/${widget.questionList.length}",
                    style: GoogleFonts.oldStandardTt(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 65, bottom: 5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    child: Text(
                      "Try Again",
                      style: GoogleFonts.ubuntu(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        primary: Colors.blue),
                    onPressed: () {
                      Get.off(() => Quiz1Screen());
                    },
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      side: const BorderSide(width: 3, color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      primary: Colors.transparent),
                  onPressed: () {
                    Get.off(() => const HomeScreen());
                  },
                  child: Text(
                    "Back To Home Page",
                    style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
