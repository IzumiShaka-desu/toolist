import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toolist/app/core/values/color_palette.dart';

import '../controllers/home_controller.dart';
import 'widgets/avatar_image.dart';
import 'widgets/home_container.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              Container(
                color: ColorPalette.mainBlue,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: Get.width * 0.5,
                child: SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 15),
                      // ignore: sized_box_for_whitespace
                      Container(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: const AvatarImage(),
                        ),
                        height: 75,
                        width: Get.width * 0.5,
                      ),
                      const VerticalDivider(thickness: 2),
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 15),
                        child: Text(
                          // provider.currentUser.name,
                          'test',
                          style: Get.textTheme.headline6?.copyWith(
                            color: ColorPalette.mainWhite,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.home_outlined,
                          color: ColorPalette.mainWhite,
                        ),
                        onTap: () {
                          controller.closeMenu();
                          controller.tabController.animateTo(0);
                        },
                        title: Text(
                          'Home',
                          style: Get.textTheme.bodyText1?.copyWith(
                            color: ColorPalette.mainWhite,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          controller.closeMenu();
                          controller.tabController.animateTo(1);
                        },
                        leading: const Icon(
                          Icons.account_circle,
                          color: ColorPalette.mainWhite,
                        ),
                        title: Text(
                          'Profile',
                          style: Get.textTheme.bodyText1?.copyWith(
                            color: ColorPalette.mainWhite,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: controller.logout,
                        hoverColor: ColorPalette.mainBlue.withOpacity(0.9),
                        leading: const Icon(
                          Icons.exit_to_app_outlined,
                          color: ColorPalette.mainWhite,
                        ),
                        title: Text(
                          'Exit',
                          style: Get.textTheme.bodyText1?.copyWith(
                            color: ColorPalette.mainWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: Get.height * 0.1,
                left: Get.width * 0.51,
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: ColorPalette.mainWhite.withOpacity(0.5)),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left_outlined),
                      iconSize: 32,
                      onPressed: controller.closeMenu,
                      color: ColorPalette.mainWhite,
                    )),
              ),
              AnimatedPositioned(
                top: controller.isMenuOpened ? Get.height * 0.08 : 0,
                left: controller.isMenuOpened ? Get.width * 0.6 : 0,
                duration: const Duration(milliseconds: 250),
                child: const HomeContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
