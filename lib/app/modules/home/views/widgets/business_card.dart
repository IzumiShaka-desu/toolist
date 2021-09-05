import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/modules/home/controllers/home_controller.dart';

import 'count_text_view.dart';
import 'task_progress.dart';

class BusinessCard extends GetView<HomeController> {
  const BusinessCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorPalette.mainWhite,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => CountTextView(
                count: controller.businessTaskCount,
              ),
            ),
            Text(
              'Businness',
              style: Get.textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => TaskProgress(
                        val: controller.businessTaskDoneCount.toDouble(),
                        max: controller.businessTaskCount.toDouble(),
                        color: ColorPalette.pink,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
