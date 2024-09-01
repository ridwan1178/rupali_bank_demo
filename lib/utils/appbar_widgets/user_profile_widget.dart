import 'package:flutter/material.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/main.dart';
import 'package:rupali_bank_demo/user_profile/presentation/user_profile_page.dart';

class UserProfileButton {
  BuildContext context;
  UserProfileButton(this.context);

  Widget userProfileImage() {
    return GestureDetector(
      onTap: () => context.pushNamed(UserProfilePage.namedRoute),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ppc.ch(10)),
        child: SizedBox(
            height: ppc.ch(44),
            width: ppc.cw(44),
            child: Image.asset(
              "assets/images/user_profile_pic.jpg",
              fit: BoxFit.contain,
              // width: 80,
              // height: 80,
            )),
      ),
    );
  }

  Widget user = Flexible(
      fit: FlexFit.loose,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ppc.ch(10)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome!",
                  style: TextStyle(
                      fontSize: ppc.cf(12),
                      fontWeight: FontWeight.w400,
                      height: ppc.clh(12, 18)),
                ),
                SizedBox(height: ppc.ch(5),),
                Text(
                  "Master Skibidbi",
                  style: TextStyle(
                      fontSize: ppc.cf(16),
                      fontWeight: FontWeight.w600,
                      height: ppc.clh(16, 24)),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: ppc.ch(44),
              width: ppc.cw(44),
              child: AppIcons.toolBar,
            )
          ],
        ),
      ));
}
