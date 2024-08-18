import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rupali_bank_demo/core/configs/app_icons.dart';

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
    return AppBar(
        toolbarHeight: 64,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: centerTitle ?? false,
        title: title,
        leading: profilePic ??
            (hideBackButton
                ? null
                : IconButton(
                    onPressed: () {
                      (route != null)
                          ? context.goNamed(routeNamed, extra: extra)
                          : context.pop();
                    },
                    icon: AppIcons.backButton
                    // const Icon(Icons.arrow_back)
                    )));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
