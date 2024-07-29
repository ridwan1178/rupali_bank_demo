import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rupali_bank_demo/core/configs/app_locale.dart';

class AppLangProvider extends ChangeNotifier {
  Locale _appLocale = Locale(Intl.getCurrentLocale());

  Locale get appLocale => _appLocale;

  void changeLocaleToEng() {
    _appLocale = AppLocale.eng;
    notifyListeners();
  }

  void changeLocaleToBn() {
    _appLocale = AppLocale.bn;
    notifyListeners();
  }
}
