import 'package:flutter/material.dart';

class BottomLeft extends StatelessWidget {
  const BottomLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("Account Holder"),
          Text("Master skibidi"),
        ],
      ),
    );
  }
}
