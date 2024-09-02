import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/main.dart';

class AppIcons {
  static const String _basepath = "assets/icons/";
  static const String _format = ".svg";

//common
  static const String _info = "${_basepath}info-circle$_format";

//crud icons
  static const String _crud = "${_basepath}crud/";
  static const String _deleteTrash = "${_crud}delete_trash$_format";

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

//onboarding icons
  static const String _onboarding = "${_basepath}onboarding/";
  static const String _onboardingNextButton =
      "${_onboarding}arrow-left$_format";
  static const String _onboardingSignin =
      "${_onboarding}empty-wallet-tick$_format";
  static const String _onboardingSignup =
      "${_onboarding}empty-wallet-add$_format";
  static const String _onboardingUnselectedRadio =
      "${_onboarding}unselected-radio$_format";
  static const String _onboardingSelectedRadio =
      "${_onboarding}selected-radio$_format";

//homepage icons
  static const String _homepage = "${_basepath}homepage/";
  static const String _hpTotalDep = "${_homepage}money-recive$_format";
  static const String _hpTotalWithdraw = "${_homepage}money-send$_format";
  static const String _hpTotalPay = "${_homepage}wallet-check$_format";
  static const String _hpTotalTrans = "${_homepage}empty-wallet-change$_format";

//fund transfer icons
  static const String _fundTransfer = "${_basepath}fund_transfer/";
  static const String _ftFavourite = "${_fundTransfer}favourite$_format";
  static const String _ftBenMgt = "${_fundTransfer}mgt$_format";
  static const String _ftMfsTransfer = "${_fundTransfer}mfsTransfer$_format";
  static const String _ftTransferHistory = "${_fundTransfer}history$_format";
  static const String _ftOtherBanks = "${_fundTransfer}other$_format";
  static const String _ftSilBank = "${_fundTransfer}sil$_format";
  static const String _ftAddBen = "${_fundTransfer}add$_format";
  static const String _ftDeleteBen = "${_fundTransfer}delete$_format";
  static const String _ftSilBankOtherSilAccount =
      "${_fundTransfer}group$_format";

//common
  static Widget cmnInfoError = SvgPicture.asset(
    _info,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.redIcon, BlendMode.srcIn),
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

//crud icons

  //delete
  static Widget deleteTrash = SvgPicture.asset(_deleteTrash, fit: BoxFit.none);

//onboarding
  static Widget onboardingNextButton =
      SvgPicture.asset(_onboardingNextButton, fit: BoxFit.none);
  static Widget onboardingSignin = SvgPicture.asset(
    _onboardingSignin,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  static Widget onboardingSignup = SvgPicture.asset(
    _onboardingSignup,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  static Widget onboardingUnselected = SvgPicture.asset(
    _onboardingUnselectedRadio,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  static Widget onboardingSelected = SvgPicture.asset(
    _onboardingSelectedRadio,
    fit: BoxFit.none,
    height: ppc.cf(28),
    width: ppc.cw(28),
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );

//homepage

  //general savings
  static Widget hpTotalDep = SvgPicture.asset(
    _hpTotalDep,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  static Widget hpTotalWithdraw = SvgPicture.asset(
    _hpTotalWithdraw,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  static Widget hpTotalPay = SvgPicture.asset(
    _hpTotalPay,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  static Widget hpTotalTrans = SvgPicture.asset(
    _hpTotalTrans,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );

//fund transfer icons
  //fav
  static Widget ftFavourite = SvgPicture.asset(
    _ftFavourite,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  //ben mgt
  static Widget ftBeneficiaryManagement = SvgPicture.asset(
    _ftBenMgt,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  //mfst
  static Widget ftMfsTransfer = SvgPicture.asset(
    _ftMfsTransfer,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  //history
  static Widget ftTransferHistory = SvgPicture.asset(
    _ftTransferHistory,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  //other
  static Widget ftOtherBanks = SvgPicture.asset(
    _ftOtherBanks,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  //sil
  static Widget ftSilBank = SvgPicture.asset(
    _ftSilBank,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );

  //sil > to other sil
  static Widget ftSilBankToOtherSilAccount = SvgPicture.asset(
    _ftSilBankOtherSilAccount,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.purpleIcon, BlendMode.srcIn),
  );

  //add
  static Widget ftAddBeneficiary = SvgPicture.asset(
    _ftAddBen,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
  );
  //del
  static Widget ftDeleteBeneficiary = SvgPicture.asset(
    _ftDeleteBen,
    fit: BoxFit.none,
    colorFilter: const ColorFilter.mode(AppColors.redIcon, BlendMode.srcIn),
  );
}
