import 'package:flutter/material.dart';

class BottomRight extends StatelessWidget {
  const BottomRight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [Text("Account Type"), Text("G.Savings")],
      ),
    );
  }
}
