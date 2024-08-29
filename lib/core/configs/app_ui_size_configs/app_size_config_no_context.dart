import 'dart:ui';

class AppSizeConfigNoContext {
  FlutterView view = PlatformDispatcher.instance.views.first;

  late double physicalWidth;
  late double physicalHeight;

  late double devicePixelRatio;

  late double screenWidth;
  late double screenHeight;
  late double safeWidth;

  AppSizeConfigNoContext() {
    physicalWidth = view.physicalSize.width;
    physicalHeight = view.physicalSize.height;

    devicePixelRatio = view.devicePixelRatio;

    screenWidth = physicalWidth / devicePixelRatio;
    screenHeight = physicalHeight / devicePixelRatio;
    //safeWidth = view.pad
  }
}
