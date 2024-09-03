import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/landing_page/presentation/landing_page.dart';
import 'package:rupali_bank_demo/main.dart';
import 'package:rupali_bank_demo/transfers/components/sil_bank_page_options.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/page_title_wiget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';

class SilBankAccountPage extends StatelessWidget {
  const SilBankAccountPage({super.key});

  static const namedRoute = "silbankaccountpage";
  static const path = "/$namedRoute";

  @override
  Widget build(BuildContext context) {
    var pageTitle = PageTitleWiget("Fund Transfer", false);
    List<Widget> options = SilBankPageOptions(context).options;
    return SafeArea(
        child: Scaffold(
      appBar: BasicAppbar(
        hideBackButton: false,
        title: pageTitle.pageTitle(),
        centerTitle: pageTitle.centerTitle,
        route: LandingPage.namedRoute,
        extra: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              options[0],
              options[1],
              const SizedBox(
                height: 29,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child:  Text(
                    "Notes",
                    style: TextStyle(fontSize: ppc.cf(14), fontWeight: FontWeight.w600),
                  )),
              const SizedBox(
                height: 8,
              ),
              notesText(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget notesText() {
    List<String> bulletPoints = [
      "There is no limit from fund transfer between own accounts",
      "For fund transfer to limit from fund transfer between own accounts.  fund transfer between own accounts",
      "There is no limit from fund transfer between own accounts",
      "There is no limit from fund transfer between own accounts"
    ];
    return Padding(
      padding:  EdgeInsets.only(left: ppc.cw(19)),
      child: Container(
          alignment: Alignment.centerLeft,
          child:  Text(
            "\u2022 ${bulletPoints[0]} \n\u2022 ${bulletPoints[1]} \n\u2022 ${bulletPoints[2]} \n\u2022 ${bulletPoints[3]}",
            style: TextStyle(fontSize: ppc.cf(11), fontWeight: FontWeight.w300, height: 2),
          )),
    );
  }
}
