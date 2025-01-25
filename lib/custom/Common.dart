import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget logoView({double width = 150, double? height}) {
  return SvgPicture.asset(
    'assets/icons/etec_logo_splash_screen.svg',
    width: width,
    height: height,
    fit: BoxFit.contain,
  );
}
