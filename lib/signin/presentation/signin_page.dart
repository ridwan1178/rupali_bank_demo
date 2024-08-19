import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rupali_bank_demo/core/configs/app_global_themes/app_input_decoration_theme.dart';
import 'package:rupali_bank_demo/core/configs/app_images.dart';
import 'package:rupali_bank_demo/core/configs/app_theme.dart';
import 'package:rupali_bank_demo/landing_page/presentation/landing_page.dart';
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
      data: AppTheme.lightTheme.copyWith(textButtonTheme: SigninTheme.textButtonThemeData),
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
                const SizedBox(
                  height: 19,
                ),
                _fieldBody(context),
                const SizedBox(
                  height: 235,
                ),
                ElevatedButton(
                  style: const ButtonStyle(fixedSize: WidgetStatePropertyAll<Size>(Size(140, 60))),
                    onPressed: () => {
                      context.pushReplacementNamed(LandingPage.namedRoute, extra: 0)
                          
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
        Text(
          text,
        ),
      ],
    );
  }

  Widget _logo1() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 53),
      child: Image.asset(AppImages.logo1),
    );
  }

  Widget _signinText() {
    return const Text(
      "Sign In",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }

  Widget _emailField(context) {
    return TextField(
      controller: _email,
      decoration: InputDecoration(hintText: AppLocalizations.of(context)!.email).applyDefaults(AppInputDecorationTheme().inputDecorationTheme)
      
    );
  }

  Widget _passField(context) {
    return TextField(
      controller: _pass,
      decoration: InputDecoration(hintText: AppLocalizations.of(context)!.pass).applyDefaults(AppInputDecorationTheme().inputDecorationTheme)
      // InputDecorationThemeSignin(
      //         hintText: AppLocalizations.of(context)!.pass)
      //     .inputDecoration(),
    );
  }

  Widget _fieldBody(context) {
    return SizedBox(
      width: 330,
      child: Column(
        children: [
          _textFieldText(AppLocalizations.of(context)!.email),
          _emailField(context),
          const SizedBox(
            height: 20,
          ),
          _textFieldText(AppLocalizations.of(context)!.pass),
          _passField(context),
        ],
      ),
    );
  }
}
