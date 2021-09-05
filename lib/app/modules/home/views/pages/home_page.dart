import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/values/box_keys.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/data/models/tasks_model.dart';
import 'package:toolist/app/global_widget/organisms/pull_widget.dart';
import 'package:toolist/app/modules/home/controllers/home_controller.dart';

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
                    child: Card(),
                  ),
                  Expanded(
                    child: Card(),
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

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.anim,
    required this.index,
    required this.item,
    required this.isPersonal,
    required this.onClickRemove,
  }) : super(key: key);

  final Animation<double> anim;
  final int index;
  final Tasks item;
  final bool isPersonal;
  final void Function() onClickRemove;
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: anim,
      child: TaskContainer(
        item: item,
        index: index,
        isPersonal: isPersonal,
        trailing: IconButton(
          icon: Icon(Icons.close),
          onPressed: onClickRemove,
        ),
      ),
    );
  }
}

class TaskContainer extends GetView<HomeController> {
  const TaskContainer({
    Key? key,
    required this.item,
    required this.isPersonal,
    required this.index,
    this.trailing,
  }) : super(key: key);

  final Tasks item;
  final int index;
  final bool isPersonal;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: InkWell(
          onTap: () => controller.updateState(index),
          child: CircleCheckBox(
            isChecked: item.isDone ?? false,
            color: isPersonal ? ColorPalette.altBlue : ColorPalette.pink,
          ),
        ),
        title: Text(
          item.taskName ?? '',
          style: Get.textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.w500,
              decoration: item.isDone ?? false
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              fontSize: 17),
        ),
        trailing: trailing ?? SizedBox(),
      ),
      color: ColorPalette.mainWhite,
    );
  }
}

class CircleCheckBox extends StatelessWidget {
  final bool isChecked;
  final Color color;

  const CircleCheckBox({
    Key? key,
    this.isChecked = false,
    this.color = ColorPalette.altBlue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 250),
      child: Container(
        decoration: BoxDecoration(
          color: isChecked ? color.withOpacity(0.5) : ColorPalette.mainWhite,
          border: Border.all(
            color: isChecked ? color.withOpacity(0.1) : color,
            width: 2,
          ),
          shape: BoxShape.circle,
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                color: ColorPalette.mainWhite,
              )
            : Icon(
                Icons.circle,
                color: Colors.transparent,
              ),
      ),
    );
  }
}
