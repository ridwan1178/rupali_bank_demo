import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/main.dart';

class Item {
  Widget itemGenerator(String title, Widget icon, String data) {
    return Container(
      height: ppc.ch(88),
      width: ppc.cw(162),
      decoration: BoxDecoration(
        color: const Color.fromARGB(15, 46, 156, 220),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            title,
            style: TextStyle(fontSize: ppc.cf(12), fontWeight: FontWeight.w400),
          ),
          Text(data,
              style:
                  TextStyle(fontSize: ppc.cf(18), fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
