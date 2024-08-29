import 'package:rupali_bank_demo/core/configs/app_ui_size_configs/app_size_config.dart';

class PixelToPercentageConverter {
  final AppSizeConfig _appSizeConfig = AppSizeConfig();

  PixelToPercentageConverter();

  static const double _figmaDeviceHeight = 812;
  static const double _figmaDeviceWidth = 375;


  double ch(double height) {
    double percantageHeight = (height / _figmaDeviceHeight) * 100;
    double convertedHeightInPixels = _appSizeConfig.safeBlockVertical * percantageHeight;

    return convertedHeightInPixels;
  }

  double cw(double width) {
    double percantageWidth = (width / _figmaDeviceWidth) * 100;
    double convertedWidthInPixels = _appSizeConfig.safeBlockHorizontal * percantageWidth;

    return convertedWidthInPixels;
  }

  double cf(double size) {
    //same implementation as width
    double percantageDensity = (size / _figmaDeviceWidth) * 100;
    double convertedFontSizeInPixels =
        _appSizeConfig.safeBlockHorizontal * percantageDensity;

    return convertedFontSizeInPixels;
  }

  double clh(double figmaFontSize, double figmaLineHeight) {
    double f = cf(figmaFontSize);
    double convertedLineHeight = f / figmaLineHeight;

    return convertedLineHeight;
  }
}
