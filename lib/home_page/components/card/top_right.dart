import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';
import 'package:rupali_bank_demo/main.dart';

class TopRight extends StatefulWidget {
  const TopRight({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  State<TopRight> createState() => _TopRightState();
}

class _TopRightState extends State<TopRight> {
  bool hide = true;

  @override
  void initState() {
    hide = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textButtonTheme:   TextButtonThemeData(style: 
           ButtonStyle(padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                  EdgeInsets.zero),
                  fixedSize: WidgetStatePropertyAll<Size>(Size(ppc.cw(147),ppc.ch(26))))
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(AppLocalizations.of(context)!.accBalance, style: TextStyle(color: Colors.white, fontSize: ppc.cf(9), fontWeight: FontWeight.w300,),),
            AnimatedCrossFade(
                firstChild: TextButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll<Color>(AppColors.background),
                        shape:
                            WidgetStatePropertyAll<LinearBorder>(LinearBorder())),
                    onPressed: () => {
                          setState(() {
                            hide = false;
                          })
                        },
                    child:  Text("Tap to reveal balance", style: TextStyle( fontSize: ppc.cf(14), fontWeight: FontWeight.w400,),), ),
                secondChild: TextButton(
                    onPressed: () => {
                          setState(() {
                            hide = true;
                          })
                        },
                    child: const Text("BDT 69420")),
                crossFadeState:
                    hide ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 1000)),
          ],
        ),
      
    );
  }
}
