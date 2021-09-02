import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/modules/home/controllers/home_controller.dart';

class TabBarViewHome extends GetView<HomeController> {
  const TabBarViewHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.tabController,
      children: controller.pages,
    );
  }
}
