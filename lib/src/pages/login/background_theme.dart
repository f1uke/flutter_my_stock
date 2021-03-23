import 'package:flutter/material.dart';

class BackgroundTheme {
  const BackgroundTheme();

  static const _gradientStart = const Color(0XFFffdde1);
  static const _gradientEnd = const Color(0XFFee9ca7);

  get gradientStart => _gradientStart;
  get gradientEnd => _gradientEnd;

  static const gradient = LinearGradient(
    colors: [
      _gradientStart,
      _gradientEnd,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
  );
}
