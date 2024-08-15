import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final dynamic route;
  final bool hideBackButton;
  // final bool showProfilePic;
  final Widget? profilePic;
  const BasicAppbar(
      {this.title, super.key, this.route, required this.hideBackButton,  this.profilePic});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 64,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: title,
        leading:  profilePic ?? (hideBackButton
            ? null
            : IconButton(
                onPressed: () {
                  route ?? context.pop();
                },
                icon: const Icon(Icons.arrow_back))));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
