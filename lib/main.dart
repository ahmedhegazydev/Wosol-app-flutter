import 'package:flutter/material.dart';
import 'package:flutter_apps/screens/tutorial/TutorialScreen.dart';
import 'package:flutter_apps/utils/Constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import 'screens/SplashScreen.dart';

void main() async {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
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
        Constants.TUTORIAL: (context) => TutorialScreen(),
        // Constants.HOME: (context) => TutorialScreen(),
        // Constants.LOGIN: (context) => TutorialScreen(),
        // Constants.HOME: (context) => HomeScreen(),
        // Constants.LOGIN: (context) => LoginScreen(),
      },

    );
  }
}
