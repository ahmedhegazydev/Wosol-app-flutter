import 'package:flutter/material.dart';
import 'package:flutter_apps/screens/TutorialScreen.dart';
import 'package:flutter_apps/utils/Constants.dart';
import 'package:lottie/lottie.dart';

import 'screens/SplashScreen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        Constants.tutorial: (context) => TutorialScreen(),
        // Constants.home: (context) => HomeScreen(),
        // Constants.login: (context) => LoginScreen(),
      },

    );
  }
}
