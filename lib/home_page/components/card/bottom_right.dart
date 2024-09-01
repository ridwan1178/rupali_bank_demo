import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/main.dart';

class BottomRight extends StatelessWidget {
  const BottomRight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Text(
            "Account Type",
            style: TextStyle(
              color: Colors.white,
              fontSize: ppc.cf(9),
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            "G.Savings",
            style: TextStyle(
              color: Colors.white,
              fontSize: ppc.cf(14),
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      
    );
  }
}
