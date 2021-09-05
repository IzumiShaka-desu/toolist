import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/modules/home/controllers/home_controller.dart';

import 'count_text_view.dart';
import 'task_progress.dart';

class PersonalCard extends GetView<HomeController> {
  const PersonalCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorPalette.mainWhite,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => CountTextView(
                count: controller.personalTaskCount,
              ),
            ),
            Text(
              'Personal',
              style: Get.textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: Obx(
                () => TaskProgress(
                  val: controller.personalTaskDoneCount.toDouble(),
                  max: controller.personalTaskCount.toDouble(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
