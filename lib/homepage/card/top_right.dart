import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rupali_bank_demo/core/configs/app_colors.dart';

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
        textButtonTheme: const  TextButtonThemeData(style: 
           ButtonStyle(padding:  WidgetStatePropertyAll<EdgeInsetsGeometry>(
                  EdgeInsets.zero),
                  fixedSize: WidgetStatePropertyAll<Size>(Size(147,26)))
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.accBalance),
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
                    child: const Text("Tap to reveal balance")),
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
      ),
    );
  }
}
