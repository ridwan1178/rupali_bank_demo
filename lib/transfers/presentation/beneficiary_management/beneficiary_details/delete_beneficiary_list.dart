import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/providers/beneficiary_management_provider.dart';
import 'package:rupali_bank_demo/models/beneficiary_model.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/delete_beneficiary_page.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/page_title_wiget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class DeleteBeneficiaryList extends StatefulWidget {
  DeleteBeneficiaryList({super.key});

  static const namedRoute = "deletebeneficiarylist";
  static const path = "${DeleteBeneficiaryPage.namedRoute}/$namedRoute";

  @override
  State<DeleteBeneficiaryList> createState() => _DeleteBeneficiaryListState();
}

class _DeleteBeneficiaryListState extends State<DeleteBeneficiaryList> {
  @override
  void initState() {
    //context.read<BeneficiaryManagementProvider>().setDefaultBenefeciaries();
    super.initState();
  }

  bool hasListUpdated = false; //currently not used

  @override
  Widget build(BuildContext context) {
    var pageTitle = PageTitleWiget("Delete Beneficiary");
    // List<BeneficiaryModel> beneficiaries =
    //     context.read<BeneficiaryManagementProvider>().beneficiaries;
    return ChangeNotifierProvider(
      create: (context) => BeneficiaryManagementProvider(),
      builder: (mainContext, child) => SafeArea(
          child: Scaffold(
        appBar: BasicAppbar(
          hideBackButton: false,
          title: pageTitle.pageTitle(),
          centerTitle: pageTitle.centerTitle,
        ),
        body: Consumer<BeneficiaryManagementProvider>(
          builder: (BuildContext context, BeneficiaryManagementProvider value,
              Widget? child) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: beneficiaries(mainContext),
              ),
            );
          },
        ),
      )),
    );
  }

  List<Widget> beneficiaries(
    BuildContext mainContext,
  ) {
    List<Widget> beneficiaries = [];
    Widget item;

    for (var beneficiary
        in mainContext.read<BeneficiaryManagementProvider>().beneficiaries) {
      item = Flexible(
        fit: FlexFit.loose,
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  "Name: ${beneficiary.name}",
                  textAlign: TextAlign.left,
                ),
                Text("Account Number: ${beneficiary.accNumber}")
              ],
            ),
            Expanded(child: SizedBox()),
            IconButton(
                onPressed: () {
                  confirmDialogue(mainContext, beneficiary);
                },
                icon: AppIcons.deleteTrash)
          ],
        ),
      );
      beneficiaries.add(item);
    }

    return beneficiaries;
  }

  Future confirmDialogue(
      BuildContext mainContext, BeneficiaryModel beneficiary) {
    return showDialog(
      context: mainContext,
      builder: (context) => AlertDialog(
        content: Text("Are you sure your want to delete ${beneficiary.name}"),
        actions: [
          cancel(mainContext),
          yesDelete(mainContext, beneficiary),
        ],
      ),
    );
  }

  TextButton yesDelete(BuildContext context, BeneficiaryModel beneficiary) {
    return TextButton(
        onPressed: () {
          context
              .read<BeneficiaryManagementProvider>()
              .removeBeneficiaryWithNotify(beneficiary);

          context.pop();
        },
        child: Text("Yes Delete"));
  }

  TextButton cancel(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.pop();
        },
        child: Text("cancel"));
  }
}
