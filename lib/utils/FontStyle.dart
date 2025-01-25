import 'dart:io';
import 'package:flutter/material.dart';

class FontStyle {
  final String fontFamily;
  final double fontSize;
  final double lineHeight;
  final FontWeight? fontWeight;

  FontStyle({
    required this.fontFamily,
    required this.fontSize,
    required this.lineHeight,
    this.fontWeight,
  });
}

FontStyle createFontStyle(double size, String weight) {
  final String fontFamily = Platform.isAndroid
      ? 'ibm_plex_sans_arabic_$weight'
      : 'IBM Plex Sans Arabic';

  final double fontSize = size;
  final double lineHeight = size * 1.2;
  // final double lineHeight = size;

  final FontWeight? fontWeight = Platform.isIOS
      ? (weight == 'bold'
      ? FontWeight.w700
      : weight == 'semibold'
      ? FontWeight.w600
      : weight == 'medium'
      ? FontWeight.w500
      : FontWeight.w400)
      : null;

  return FontStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    lineHeight: lineHeight,
    fontWeight: fontWeight,
  );
}

class Fonts {
  static final titleBold28 = createFontStyle(28, 'bold');
  static final titleSemiBold28 = createFontStyle(28, 'semibold');
  static final titleMedium28 = createFontStyle(28, 'medium');
  static final titleRegular28 = createFontStyle(28, 'regular');

  static final subTitleBold20 = createFontStyle(20, 'bold');
  static final subTitleSemiBold20 = createFontStyle(20, 'semibold');
  static final subTitleMedium20 = createFontStyle(20, 'medium');
  static final subTitleRegular20 = createFontStyle(20, 'regular');

  static final contentBold16 = createFontStyle(16, 'bold');
  static final contentSemiBold16 = createFontStyle(16, 'semibold');
  static final contentMedium16 = createFontStyle(16, 'medium');
  static final contentRegular16 = createFontStyle(16, 'regular');

  static final smallBold12 = createFontStyle(12, 'bold');
  static final smallSemiBold12 = createFontStyle(12, 'semibold');
  static final smallMedium12 = createFontStyle(12, 'medium');
  static final smallRegular12 = createFontStyle(12, 'regular');
}
