import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';
import 'package:rupali_bank_demo/main.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final String? route;
  final dynamic extra;
  final bool hideBackButton;
  final bool? centerTitle;
  // final bool showProfilePic;
  final Widget? profilePic;
  const BasicAppbar(
      {this.title,
      super.key,
      this.route,
      required this.hideBackButton,
      this.profilePic,
      this.centerTitle,
      this.extra});

  @override
  Widget build(BuildContext context) {
    String routeNamed = route ?? "";
    double padding;
    if (profilePic == null) {
      padding = 0;
    } else {
      padding = ppc.cw(19);
    }
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: AppBar(
          toolbarHeight: ppc.ch(64),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: centerTitle ?? false,
          title: title,
          leading: profilePic ??
              (hideBackButton
                  ? null
                  : GestureDetector(
                      onTap: () {
                        (route != null)
                            ? context.goNamed(routeNamed, extra: extra)
                            : context.pop();
                      },
                      child: AppIcons.backButton,
                    ))),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ppc.ch(64));
}
