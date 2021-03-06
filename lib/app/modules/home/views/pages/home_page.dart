import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/values/box_keys.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/modules/home/controllers/home_controller.dart';
import 'package:toolist/app/modules/home/views/widgets/business_card.dart';
import 'package:toolist/app/modules/home/views/widgets/personal_card.dart';
import 'package:toolist/app/modules/home/views/widgets/tasks_list_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.secondary,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                'What\'s up, ${controller.user?.userMetadata[BoxKeys.savedFName]}! ',
                style: Get.textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.mainBlue,
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              height: 100,
              child: Row(
                children: const [
                  Expanded(
                    child: PersonalCard(),
                  ),
                  Expanded(
                    child: BusinessCard(),
                  ),
                ],
              ),
            ),
            const Flexible(
              child: TasksListView(),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: controller.addTask,
          backgroundColor: ColorPalette.altBlue,
        ),
      ),
    );
  }
}
