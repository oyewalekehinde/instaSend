import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double _screenWidth;
  static late double _screenHeight;

  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static late double textSizeMultiplier;
  static late double imageSizeMultiplier;

  static late double heightMultiplier;
  static late double widthMultiplier;

  void init(BoxConstraints constraints) {
    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textSizeMultiplier = _blockWidth;
    imageSizeMultiplier = _blockWidth;

    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    print(_screenWidth);
    print(_screenHeight);
  }
}
