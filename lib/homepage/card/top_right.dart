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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.accBalance),
          AnimatedCrossFade(
              firstChild: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(AppColors.background),
                      shape:
                          WidgetStatePropertyAll<LinearBorder>(LinearBorder())),
                  onPressed: () => {
                        setState(() {
                          hide = false;
                        })
                      },
                  child: Text("Tap to reveal balance")),
              secondChild: TextButton(
                  onPressed: () => {
                        setState(() {
                          hide = true;
                        })
                      },
                  child: Text("BDT 69420")),
              crossFadeState:
                  hide ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: Duration(milliseconds: 1000)),
        ],
      ),
    );
  }
}
