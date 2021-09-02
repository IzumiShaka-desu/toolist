import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toolist/app/core/values/color_palette.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
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
              Container(
                width: Get.width * 0.5,
                child: SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 15),
                      Container(
                        child: Container(
                          padding: EdgeInsets.all(5),
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
                      VerticalDivider(thickness: 2),
                      Container(
                        padding: EdgeInsets.only(top: 20, left: 15),
                        child: Text(
                          // provider.currentUser.name,
                          'test',
                          style: Get.textTheme.headline6?.copyWith(
                            color: ColorPalette.mainWhite,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
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
                        leading: Icon(
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
                        leading: Icon(
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
                      icon: Icon(Icons.chevron_left_outlined),
                      iconSize: 32,
                      onPressed: controller.closeMenu,
                      color: ColorPalette.mainWhite,
                    )),
              ),
              AnimatedPositioned(
                top: controller.isMenuOpened ? Get.height * 0.08 : 0,
                left: controller.isMenuOpened ? Get.width * 0.6 : 0,
                duration: Duration(milliseconds: 250),
                child: const HomeContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
            duration: Duration(
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
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
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

class TabBarViewHome extends GetView<HomeController> {
  const TabBarViewHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller.tabController,
      children: controller.pages,
    );
  }
}

class OpenMenuButton extends GetView<HomeController> {
  const OpenMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
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

class AvatarImage extends GetView<HomeController> {
  const AvatarImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      minRadius: 35,
      maxRadius: 40,
      backgroundColor: ColorPalette.mainWhite,
    );
  }
}
