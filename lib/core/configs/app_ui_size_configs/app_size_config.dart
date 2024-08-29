//credits to https://medium.com/flutter-community/flutter-effectively-scale-ui-according-to-different-screen-sizes-2cb7c115ea0a

import 'dart:ui';

class AppSizeConfig {
  FlutterView view = PlatformDispatcher.instance.views.first;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _blockSizeHorizontal;
  static late double _blockSizeVertical;
  static late double _devicePixelRatio;

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

  AppSizeConfig() {
    double physicalWidth = view.display.size.width;
    double physicalHeight = view.display.size.height;

    _devicePixelRatio = view.devicePixelRatio;

    _screenWidth = physicalWidth / _devicePixelRatio;
    _screenHeight = physicalHeight / _devicePixelRatio;

    print("print size  = $_screenWidth x $_screenHeight");
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    _safeAreaHorizontal = view.viewPadding.left + view.viewPadding.right;
    _safeAreaVertical = view.viewPadding.top + view.viewPadding.bottom;
    _safeBlockHorizontal = (_screenWidth - _safeAreaHorizontal) / 100;

    _safeBlockVertical = (_screenHeight - _safeAreaVertical) / 100;
  }
}
