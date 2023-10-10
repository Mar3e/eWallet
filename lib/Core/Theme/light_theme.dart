import 'package:flutter/material.dart';
import '../Constants/colors_consts.dart';

ThemeData getLightThemeData() => ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      fontFamily: "DG Modal3at",
      colorScheme: const ColorScheme.light(
        primary: LightColors.primaryColor,
        secondary: LightColors.secondaryColor,
        background: Colors.white,
      ),
      //todo inputDecorationTheme: ,
    );
