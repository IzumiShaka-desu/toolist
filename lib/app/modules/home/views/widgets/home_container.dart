import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/modules/home/controllers/home_controller.dart';

import 'open_menu_button.dart';
import 'tabbarview_home.dart';

class HomeContainer extends GetView<HomeController> {
  const HomeContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Obx(
        () => Transform.scale(
          alignment: Alignment.topRight,
          scale: controller.isMenuOpened ? 0.85 : 1,
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 300,
            ),
            padding: EdgeInsets.all(
              controller.isMenuOpened ? 25 : 0,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                color: ColorPalette.secondary),
            child: Scaffold(
              backgroundColor: ColorPalette.secondary,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: const OpenMenuButton(),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              body: const TabBarViewHome(),
            ),
          ),
        ),
      ),
    );
  }
}
