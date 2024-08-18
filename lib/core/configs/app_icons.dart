import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';

class AppIcons {
  static const String _basepath = "assets/icons/";
  static const String _format = ".svg";

//bot navbar constants
  static const String _botNavbar = "${_basepath}bottom_navbar/";
  static const String _homeSvg = "${_botNavbar}home-2$_format";
  static const String _paymentSvg = "${_botNavbar}wallet-check$_format";
  static const String _transferSvg = "${_botNavbar}empty-wallet-change$_format";
  static const String _cardsSvg = "${_botNavbar}cards$_format";
  static const String _servicesSvg = "${_botNavbar}box$_format";

//appbar
static const String _appbar = "${_basepath}appbar/";
static const String _toolbar = "${_appbar}category-2$_format";
static const String _backButton = "${_appbar}arrow-left$_format";

  static const Icon tickMark = Icon(
    IconData(0xe1f6, fontFamily: 'MaterialIcons'),
    color: Colors.white,
  );

//bottom nav bar icons

  //home
  static Widget home = SvgPicture.asset(_homeSvg, fit: BoxFit.none);

  static Widget homeActive = SvgPicture.asset(
    _homeSvg,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );

  //payment
  static Widget payment = SvgPicture.asset(_paymentSvg, fit: BoxFit.none);

  static Widget paymentActive = SvgPicture.asset(
    _paymentSvg,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );

  //transfer
  static Widget transfer = SvgPicture.asset(_transferSvg, fit: BoxFit.none);

  static Widget transferActive = SvgPicture.asset(
    _paymentSvg,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );

  //cards
  static Widget cards = SvgPicture.asset(_paymentSvg, fit: BoxFit.none);

  static Widget cardsActive = SvgPicture.asset(
    _cardsSvg,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );

  //services
  static Widget services = SvgPicture.asset(_paymentSvg, fit: BoxFit.none);

  static Widget servicesActive = SvgPicture.asset(
    _servicesSvg,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );

//appbar icons

  //toolbar
static Widget toolBar = SvgPicture.asset(_toolbar, fit: BoxFit.none);
static Widget backButton = SvgPicture.asset(_backButton, fit: BoxFit.none);
}
