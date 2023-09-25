import 'package:flutter/material.dart';

class SizesConfig {
  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier = 0;
  static double imageSizeMultiplier = 0;
  static double heightMultiplier = 0;
  static double widthMultiplier = 0;
  // static bool isPortrait = true;
  // static bool isMobilePortrait = false;// there is on orientation in this app

  void init(BoxConstraints constraints) {
    // void init(BoxConstraints constraints, Orientation orientation) {
    // if (orientation == Orientation.portrait) {
    //   _screenWidth = constraints.maxWidth;
    //   _screenHeight = constraints.maxHeight;
    //   isPortrait = true;
    //   if (_screenWidth < 450) {
    //     isMobilePortrait = true;
    //   }
    // } else {
    //   _screenWidth = constraints.maxHeight;
    //   _screenHeight = constraints.maxWidth;
    //   isPortrait = false;
    //   isMobilePortrait = false;
    // }

    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockWidth;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
  }
}
