import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/values/box_keys.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/data/models/tasks_model.dart';
import 'package:toolist/app/global_widget/organisms/pull_widget.dart';
import 'package:toolist/app/modules/home/controllers/home_controller.dart';
import 'package:toolist/app/modules/home/views/widgets/business_card.dart';
import 'package:toolist/app/modules/home/views/widgets/circle_check_box.dart';
import 'package:toolist/app/modules/home/views/widgets/count_text_view.dart';
import 'package:toolist/app/modules/home/views/widgets/item_card.dart';
import 'package:toolist/app/modules/home/views/widgets/personal_card.dart';
import 'package:toolist/app/modules/home/views/widgets/task_container.dart';
import 'package:toolist/app/modules/home/views/widgets/task_progress.dart';
import 'package:toolist/app/modules/home/views/widgets/tasks_list_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.secondary,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                'What\'s up, ${controller.user?.userMetadata[BoxKeys.savedFName]}! ',
                style: Get.textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.mainBlue,
                ),
              ),
            ),
            Container(
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
            Flexible(
              child: TasksListView(),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: controller.addTask,
          backgroundColor: ColorPalette.altBlue,
        ),
      ),
    );
  }
}
