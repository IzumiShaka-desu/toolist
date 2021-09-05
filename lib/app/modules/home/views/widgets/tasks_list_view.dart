import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/data/models/tasks_model.dart';
import 'package:toolist/app/global_widget/organisms/pull_widget.dart';
import 'package:toolist/app/modules/home/controllers/home_controller.dart';

import 'item_card.dart';

class TasksListView extends GetView<HomeController> {
  const TasksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PullWidget(
        onLoad: (refreshController) {
          refreshController.loadComplete();
          // controller.loadTask().whenComplete(() =>
          //  null);
        },
        onRefresh: (refreshController) {
          controller.loadTasks().whenComplete(
                () => refreshController.refreshCompleted(),
              );
        },
        child: SingleChildScrollView(
          child: Obx(
            () => controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : AnimatedList(
                    shrinkWrap: true,
                    reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(8),
                    key: controller.animateKey,
                    initialItemCount: controller.taskList.length,
                    itemBuilder: (BuildContext context, int index, anim) {
                      Tasks item = controller.taskList.elementAt(index);
                      bool isPersonal = item.type == TaskType.personal;
                      return ItemCard(
                        anim: anim,
                        item: item,
                        index: index,
                        isPersonal: isPersonal,
                        onClickRemove: () => controller.removeTask(index),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
