import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final dynamic route;
  final bool hideBackButton;
  const BasicAppbar(
      {this.title, super.key, this.route, required this.hideBackButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: title,
        leading: hideBackButton
            ? null
            : IconButton(
                onPressed: () {
                  route ?? context.pop();
                },
                icon: const Icon(Icons.arrow_back)));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
