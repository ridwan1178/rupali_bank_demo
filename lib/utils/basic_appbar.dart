import 'package:flutter/material.dart';

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
        //automaticallyImplyLeading: false,
        leading: hideBackButton
            ? null
            : IconButton(
                onPressed: () {
                  route ?? Navigator.pop(context);
                  // Navigator.pop(context,
                  //     MaterialPageRoute(builder: (context) => route));
                },
                icon: const Icon(Icons.arrow_back)));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
