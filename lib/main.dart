import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'SplashScreen.dart';

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
        // '/tutorial': (context) => TutorialScreen(),
        // '/home': (context) => HomeScreen(),
        // '/login': (context) => LoginScreen(),
      },

    );
  }
}
