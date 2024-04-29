import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool center;
  final bool backicon;
  final bool carticon;
  final bool ismoreicon;
  final VoidCallback ontap;
  static _defaultFunction() {
    Get.back();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  BaseAppBar(
      {Key? key,
      this.title = 'GB Marketing',
      this.center = true,
      this.backicon = false,
      this.ontap = _defaultFunction,
      this.ismoreicon = false,
      this.carticon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: center,
        title: Txt(
          text: title,
          color: backicon ? Colors.black : Colors.transparent,
        ),
        actions: [
          if (carticon)
            InkWell(
                onTap: () {
                  // Get.to(() => NotificationsView());
                },
                child: Image.asset(
                  'assets/notifications_black.png',
                  height: 17,
                )),
        ],
        leading: backicon
            ? IconButton(
                onPressed: ontap,
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ))
            : InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    'assets/drawer.png',
                    height: 17,
                  ),
                )),
        backgroundColor: Colors.transparent);
  }
}
