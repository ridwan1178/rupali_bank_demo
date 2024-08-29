//credits to https://medium.com/flutter-community/flutter-effectively-scale-ui-according-to-different-screen-sizes-2cb7c115ea0a

import 'package:flutter/material.dart';

class AppSizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _blockSizeHorizontal;
  static late double _blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double _safeBlockHorizontal;
  static late double _safeBlockVertical;

  double get screenWidth => _screenWidth;
  double get screenHeight => _screenHeight;
  double get blockSizeHorizontal => _blockSizeHorizontal;
  double get blockSizeVertical => _blockSizeVertical;

  double get safeAreaHorizontal => _safeAreaHorizontal;
  double get safeAreaVertical => _safeAreaVertical;
  double get safeBlockHorizontal => _safeBlockHorizontal;
  double get safeBlockVertical => _safeBlockVertical;

  AppSizeConfig(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    _safeBlockHorizontal = (_screenWidth - _safeAreaHorizontal) / 100;
    _safeBlockVertical = (_screenHeight - _safeAreaVertical) / 100;
  }
}
