import 'package:flutter/material.dart';
import 'package:flutter_apps/screens/login/LoginScreen.dart';
import 'package:flutter_apps/screens/tutorial/TutorialScreen.dart';
import 'package:flutter_apps/utils/Constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
    return Directionality(
      textDirection: TextDirection.rtl, // Force RTL
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar', ''), // Arabic
          Locale('he', ''), // Hebrew
        ],
        locale: Locale('ar', ''), // Force Arabic
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          Constants.TUTORIAL: (context) => TutorialScreen(),
          Constants.HOME: (context) => TutorialScreen(),
          Constants.LOGIN: (context) => LoginScreen(),
          // Constants.HOME: (context) => HomeScreen(),
          // Constants.LOGIN: (context) => LoginScreen(),
        },
      ),
    );
  }
}
