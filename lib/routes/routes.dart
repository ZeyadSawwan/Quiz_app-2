import 'package:flutter/material.dart';
import 'package:questions_app/screens/quiz1/quiz1.dart';

import '../screens/home/home_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const HomeScreen(),
  Quiz1Screen.screenRoute: (context) => Quiz1Screen(),
  // Screen3.screenRoute: (context) => const Screen3(),
};
