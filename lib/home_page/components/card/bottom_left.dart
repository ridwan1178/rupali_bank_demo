import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/main.dart';

class BottomLeft extends StatelessWidget {
  const BottomLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: Column(
          children: [
            Text(
              "Account Holder",
              style: TextStyle(color: Colors.white, fontSize: ppc.cf(9), fontWeight: FontWeight.w300,),
            ),
            Text(
              "Master skibidi",
              style: TextStyle(color: Colors.white, fontSize: ppc.cf(14), fontWeight: FontWeight.w500),
            ),
          ],
        ),
      
    );
  }
}
