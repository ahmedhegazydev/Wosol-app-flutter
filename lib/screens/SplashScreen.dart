import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apps/utils/Constants.dart';
import 'package:flutter_apps/utils/PrefManager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../custom/Common.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool animationLoaded = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _setStatusBarStyle();
    _controller = AnimationController(vsync: this);
  }

  void _setStatusBarStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  Future<void> _navigateOnAnimationComplete() async {
    final firstLaunch = await PrefManager.getFirstLaunch();
    final isAppUpdateNeeded = await PrefManager.getAppUpdateNeeded();
    final isLoggedIn = await PrefManager.getIsLoggedIn();
    final appData = await PrefManager.getAppLaunched();

    if (!firstLaunch) {
      await PrefManager.setFirstLaunch(true);
      if (mounted) {
        Navigator.pushReplacementNamed(context, Constants.TUTORIAL);
      }
    } else if (isLoggedIn == Constants.VALUE_IS_LOGGED_IN && !isAppUpdateNeeded) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Constants.HOME);
      }
    } else {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Constants.LOGIN);
        // Navigator.pushReplacementNamed(context, Constants.TUTORIAL);//for testing
      }
    }

    if (appData == null) {
      await PrefManager.setAppLaunched(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/animations/splashScreen_2.json',
                    width: 122,
                    height: 122,
                    repeat: false,
                    controller: _controller,
                    onLoaded: (composition) {
                      _controller
                        ..duration = composition.duration
                        ..forward()
                            .whenComplete(() => _navigateOnAnimationComplete());
                    },
                  ),
                  SizedBox(height: 20),
                  SvgPicture.asset(
                    'assets/icons/wosol.svg',
                    width: 130,
                    height: 89,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child:
               logoView()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
