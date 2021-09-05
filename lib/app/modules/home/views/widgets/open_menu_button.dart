import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/modules/home/controllers/home_controller.dart';

class OpenMenuButton extends GetView<HomeController> {
  const OpenMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.menu_rounded,
        color: Colors.grey,
      ),
      onPressed: () {
        controller.isMenuOpened
            ? controller.closeMenu()
            : controller.openMenu();
      },
    );
  }
}
