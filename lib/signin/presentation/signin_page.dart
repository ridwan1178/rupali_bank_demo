import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rupali_bank_demo/core/configs/app_global_themes/app_input_decoration_theme.dart';
import 'package:rupali_bank_demo/core/configs/app_images.dart';
import 'package:rupali_bank_demo/core/configs/app_theme.dart';
import 'package:rupali_bank_demo/landing_page/presentation/landing_page.dart';
import 'package:rupali_bank_demo/main.dart';
import 'package:rupali_bank_demo/providers/app_lang_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/signin/configs/signin_theme.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  static const path = "/signin";
  static const namedRoute = "signin";

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.lightTheme
          .copyWith(textButtonTheme: SigninTheme.textButtonThemeData),
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                  onPressed: () =>
                      {context.read<AppLangProvider>().changeLocaleToEng()},
                  child: const Text("English")),
              const Text(" ."),
              TextButton(
                  onPressed: () =>
                      {context.read<AppLangProvider>().changeLocaleToBn()},
                  child: const Text("বাংলা")),
            ],
          ),
          leading: null,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                _logo1(),
                _signinText(),
                 SizedBox(
                  height: ppc.ch(19),
                ),
                _fieldBody(context),
                 SizedBox(
                  height: ppc.ch(101),
                ),
                ElevatedButton(
                    style:  ButtonStyle(
                        fixedSize: WidgetStatePropertyAll<Size>(Size(ppc.cw(140), ppc.ch(60)))),
                    onPressed: () => {
                      //extra 0 is for home page, see basic bot nav for other indexes
                          context.pushReplacementNamed(LandingPage.namedRoute,
                              extra: 0)
                        },
                    child: Text(AppLocalizations.of(context)!.signin))
              ],
            ),
          ),
        ),
      )),
    );
  }

  Row _textFieldText(String text) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: ppc.ch(8)),
          child: Text(
            text,
            style: TextStyle(fontSize: ppc.cf(16), fontWeight: FontWeight.w500, height: ppc.clh(16, 24)),
          ),
        ),
      ],
    );
  }

  Widget _logo1() {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: ppc.ch(53)),
      child: Image.asset(AppImages.logo1),
    );
  }

  Widget _signinText() {
    return  Text(
      "SIGN IN",
    
      style: TextStyle(
        height: ppc.clh(24, 36),
        fontWeight: FontWeight.w700,
        fontSize: ppc.cf(24),
        
      ),
    );
  }

  Widget _emailField(context) {
    return TextField(
        controller: _email,
        decoration:
            InputDecoration(hintText: AppLocalizations.of(context)!.email)
                .applyDefaults(AppInputDecorationTheme().inputDecorationTheme));
  }

  Widget _passField(context) {
    return TextField(
        controller: _pass,
        decoration:
            InputDecoration(hintText: AppLocalizations.of(context)!.pass)
                .applyDefaults(AppInputDecorationTheme().inputDecorationTheme)

        );
  }

  Widget _fieldBody(context) {
    return SizedBox(
      width: ppc.cw(330),
      height: ppc.ch(342),
      child: Column(
        children: [
          _textFieldText(AppLocalizations.of(context)!.email),
          _emailField(context),
           SizedBox(
            height: ppc.ch(20),
          ),
          _textFieldText(AppLocalizations.of(context)!.pass),
          _passField(context),
        ],
      ),
    );
  }
}
