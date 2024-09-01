import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/core/configs/app_theme.dart';
import 'package:rupali_bank_demo/main.dart';
import 'package:rupali_bank_demo/providers/homepage_account_statement_provider.dart';

class AccountStatementOptions extends StatefulWidget {
  const AccountStatementOptions({super.key});

  @override
  State<AccountStatementOptions> createState() =>
      _AccountStatementOptionsState();
}

class _AccountStatementOptionsState extends State<AccountStatementOptions> {
  int index = 0;
  Color enabled = AppColors.primary;
  Color disabled = AppColors.background;
  @override
  Widget build(BuildContext context) {
    
    return Theme(
      data: AppTheme.lightTheme.copyWith(textTheme: Theme.of(context).textTheme.apply(fontSizeFactor: 1)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 40,
          
            child: ListView(scrollDirection: Axis.horizontal, children: [
              TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    backgroundColor: index == 0 ? enabled : disabled,
                    foregroundColor: index == 0 ? disabled : enabled,
                  ),
                  onPressed: () => {
                        setState(() {
                          index = 0;
                        }),
                        context
                            .read<HomepageAccountStatementProvider>()
                            .selectedSavings()
                      },
                  child:  Text("Savings", style: TextStyle(fontSize: ppc.cf(14), fontWeight: FontWeight.w500),)),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: index == 1 ? enabled : disabled,
                      foregroundColor: index == 1 ? disabled : enabled,),
                  onPressed: () => {
                        setState(() {
                          index = 1;
                        }),
                        context
                            .read<HomepageAccountStatementProvider>()
                            .selectedLoan()
                      },
                  child: Text("Loans", style: TextStyle(fontSize: ppc.cf(14), fontWeight: FontWeight.w500),)),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: index == 2 ? enabled : disabled,
                      foregroundColor: index == 2 ? disabled : enabled,),
                  onPressed: () => {
                        setState(() {
                          index = 2;
                        }),
                        context
                            .read<HomepageAccountStatementProvider>()
                            .selectedDPS()
                      },
                  child:  Text("DPS", style: TextStyle(fontSize: ppc.cf(14), fontWeight: FontWeight.w500),), ),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: index == 3 ? enabled : disabled,
                      foregroundColor: index == 3 ? disabled : enabled,),
                  onPressed: () => {
                        setState(() {
                          index = 3;
                        }),
                        context
                            .read<HomepageAccountStatementProvider>()
                            .selectedFD()
                        
                      },
                  child:  Text("FD", style: TextStyle(fontSize: ppc.cf(14), fontWeight: FontWeight.w500),)),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: index == 4 ? enabled : disabled,
                      foregroundColor: index == 4 ? disabled : enabled,),
                  onPressed: () => {
                        setState(() {
                          index = 4;
                        }),
                        context
                            .read<HomepageAccountStatementProvider>()
                            .selectedCards()
                      },
                  child: Text("Cards", style: TextStyle(fontSize: ppc.cf(14), fontWeight: FontWeight.w500),)),
            ]),
          
        ),
      ),
    );
  }
}
