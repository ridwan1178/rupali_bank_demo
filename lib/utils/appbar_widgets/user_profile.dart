import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';

class UserProfileButton {
  IconButton userProfileButton = IconButton(
    iconSize: 80,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      onPressed: () => {},
      icon: Image.asset(
        "assets/images/user_profile_pic.jpg",
        fit: BoxFit.contain,
        // width: 80,
        // height: 80,
      ));

  Widget user =  Flexible(
    fit: FlexFit.loose,
    child: Row(
      children: [
        const Text("Welcome\nMaster Skibidi", style: TextStyle(fontSize: 16),),
        const Spacer(),
        IconButton(onPressed: ()=>{}, icon: AppIcons.toolBar)
      ],
    )
  );
}
