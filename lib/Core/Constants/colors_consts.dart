import 'package:flutter/material.dart';

class LightColors {
  static const primaryColor = Color(0xff2589BD);
  static const secondaryColor = Color(0xffEBF2FA);
  static const clickAblesColor = Color(0xff1446A0);

  static const sarCurrencyGradient = LinearGradient(
    colors: [
      Color(0xff98C1D9),
      Color(0xff759CCB),
      Color(0xff6684B3),
    ],
    stops: [0.2, 0.55, 0.8],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const yerCurrencyGradient = LinearGradient(
    colors: [
      Color(0xffFBFCDA),
      Color(0xffC8E8C1),
      Color(0xffCDDE8D),
    ],
    stops: [0.0, 0.4, 0.99],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const usdCurrencyGradient = LinearGradient(
    colors: [
      Color(0xffC5E3E4),
      Color(0xffD4DDE2),
      Color(0xffCDD7E0),
      Color(0xffB0B9C2),
    ],
    stops: [0.2, 0.5, 0.7, 0.99],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
