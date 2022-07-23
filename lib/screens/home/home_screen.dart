import 'package:flutter/material.dart';
import 'package:questions_app/screens/quiz1/quiz1.dart';
import '../../shared/shared_widget.dart';

class HomeScreen extends StatelessWidget {
  static const screenRoute = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomWidgets().backgroundColor,
      body: SafeArea(
        child: ListView(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Image.asset(
                CustomWidgets().mainLogo,
                scale: 3.5,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Quiz1Screen(),
                  ),
                );
              },
              child: tab(context, "Questions")),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 6),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 35,
                  color: Colors.transparent,
                  child: const Text("contact us"),
                ),
                Expanded(child: Container()),
                Container(
                  width: 70,
                  height: 35,
                  color: Colors.transparent,
                  child: const Text("About us"),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

Widget tab(
  BuildContext context,
  String txt,
) {
  return Padding(
    padding: const EdgeInsets.only(top: 25, bottom: 25),
    child: Container(
      height: MediaQuery.of(context).size.width * 0.17,
      width: MediaQuery.of(context).size.width - 80,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 25, 98, 233))),
      child: Center(
        child: Text(
          txt,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    ),
  );
}
