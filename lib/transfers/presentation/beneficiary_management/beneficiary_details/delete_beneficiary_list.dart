import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/providers/beneficiary_management_provider.dart';
import 'package:rupali_bank_demo/transfers/models/beneficiary_model.dart';
import 'package:rupali_bank_demo/transfers/presentation/beneficiary_management/delete_beneficiary_page.dart';
import 'package:rupali_bank_demo/utils/appbar_widgets/page_title_wiget.dart';
import 'package:rupali_bank_demo/utils/basic_appbar.dart';
import 'package:provider/provider.dart';

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
    return SafeArea(
        child: Scaffold(
      appBar: BasicAppbar(
        hideBackButton: false,
        title: pageTitle.pageTitle(),
        centerTitle: pageTitle.centerTitle,
      ),
      body: Consumer<BeneficiaryManagementProvider>(
        builder: (BuildContext context, BeneficiaryManagementProvider value, Widget? child) { 
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
            children: beneficiaries(context),
                    ),
          );
         },
        
      ),
    ));
  }

  List<Widget> beneficiaries(BuildContext context, ) {
    List<Widget> beneficiaries = [];
    Widget item;

    for (var beneficiary
        in context.read<BeneficiaryManagementProvider>().beneficiaries) {
      item = Flexible(
        fit: FlexFit.loose,
        child: Row(
          children: [
            Column(
              
              children: [Text("Name: ${beneficiary.name}", textAlign: TextAlign.left,), Text("Account Number: ${beneficiary.accNumber}")],
            ),
            Expanded(child: SizedBox()),
            IconButton(
                onPressed: () {
                  context
                      .read<BeneficiaryManagementProvider>()
                      .removeBeneficiaryWithNotify(beneficiary);
                },
                icon: AppIcons.deleteTrash)
          ],
        ),
      );
      beneficiaries.add(item);
    }

    return beneficiaries;
  }
}
