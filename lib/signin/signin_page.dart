import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rupali_bank_demo/core/configs/app_images.dart';
import 'package:rupali_bank_demo/signin/input_decoration_theme.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextButton(onPressed: () => {}, child: const Text("english")),
            const Text(" . "),
            TextButton(onPressed: () => {}, child: const Text("বাংলা")),
          ],
        ),
        leading: null,
      ),
      body: Center(
        child: Column(
          children: [
            _logo1(),
            _signinText(),
            const SizedBox(
              height: 19,
            ),
            _fieldBody(),
            const SizedBox(
              height: 235,
            ),
            ElevatedButton(onPressed: () => {}, child: const Text("Sign In"))
          ],
        ),
      ),
    ));
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
      "sign in",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _email,
      decoration:
          const InputDecorationThemeSignin(hintText: "Email").inputDecoration(),
    );
  }

  Widget _passField() {
    return TextField(
      controller: _pass,
      decoration: const InputDecorationThemeSignin(hintText: "Password")
          .inputDecoration(),
    );
  }

  Widget _fieldBody() {
    return SizedBox(
      width: 330,
      child: Column(
        children: [
          _textFieldText("Email"),
          _emailField(),
          const SizedBox(
            height: 20,
          ),
          _textFieldText("Password"),
          _passField(),
        ],
      ),
    );
  }
}
