import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase/supabase.dart';
import 'package:toolist/app/core/utils/debug_utils.dart';
import 'package:toolist/app/data/models/tasks_model.dart';
import 'package:toolist/app/data/repository/tasks_repository.dart';
import 'package:toolist/app/global_widget/molecules/confirm_dialog.dart';
import 'package:toolist/app/modules/home/views/add_task_view.dart';
import 'package:toolist/app/modules/home/views/pages/home_page.dart';
import 'package:toolist/app/modules/home/views/pages/profile_page.dart';
import 'package:toolist/app/modules/home/views/widgets/item_card.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  final TasksRepository _repository = Get.find();

  final SupabaseClient _client = Get.find();

  final animateKey = GlobalKey<AnimatedListState>();

  final _taskList = <Tasks>[].obs;
  List<Tasks> get taskList => _taskList;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late final TabController _controller;
  TabController get tabController => _controller;

  final _pages = [const HomePage(), const ProfilePage()];
  List<Widget> get pages => _pages;

  final _isMenuOpened = false.obs;
  bool get isMenuOpened => _isMenuOpened.value;

  void openMenu() => _isMenuOpened.value = true;
  void closeMenu() => _isMenuOpened.value = false;

  bool _isUpdating = false;

  User? get user => _client.auth.currentUser;

  int get personalTaskCount => _taskList
      .where(
        (element) => element.type == TaskType.personal,
      )
      .length;

  int get personalTaskDoneCount => _taskList
      .where(
        (element) =>
            element.type == TaskType.personal && (element.isDone ?? false),
      )
      .length;

  int get businessTaskCount => _taskList
      .where(
        (element) => element.type == TaskType.business,
      )
      .length;
  int get businessTaskDoneCount => _taskList
      .where(
        (element) =>
            element.type == TaskType.business && (element.isDone ?? false),
      )
      .length;

  @override
  void onInit() {
    _controller = TabController(
      length: pages.length,
      vsync: this,
    );
    Future.wait(
      [
        loadTasks(),
      ],
    );
    super.onInit();
  }

  Future<void> loadTasks() async {
    _isLoading.value = true;
    try {
      _taskList.value = await _repository.getList();
    } catch (e) {
      DebugUtils.print(
        className: 'LoadTask',
        message: e.toString(),
      );
    }
    _isLoading.value = false;
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    _controller.dispose();
  }

  void logout() {}

  void addTask() async {
    final newTask = await showGeneralDialog<Tasks>(
      context: Get.context!,
      transitionDuration: Duration(
        milliseconds: 400,
      ),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return ScaleTransition(
          scale: animation,
          child: AddtaskView(),
        );
      },
    );
    if (newTask != null) {
      newTask.id = '${user?.id}-${DateTime.now().microsecondsSinceEpoch}';

      newTask.uid = user!.id;
      try {
        final _res = await _repository.add(
          newTask,
        );
        Get.snackbar(
          'info',
          _res
              ? 'success add new task'
              : 'can\'t add new task please try again',
        );
        if (_res) {
          taskList.add(newTask);
          animateKey.currentState?.insertItem(
            taskList.length - 1,
          );
        }
      } catch (e) {
        debugPrint('$e');
      }
    }
  }

  void removeTask(int index) async {
    bool? _isConfirmed = await Get.dialog<bool>(
      ConfirmDialogs(
        title: 'warning',
        message: 'are you sure wan\'t delete this item',
      ),
    );
    try {
      if (_isConfirmed ?? false) {
        bool _result = await _repository.delete(
          taskList
              .elementAt(
                index,
              )
              .id!,
        );
        if (_result) {
          final deletedTasks = taskList.elementAt(
            index,
          );
          animateKey.currentState?.removeItem(
            index,
            (context, anim) => ItemCard(
              anim: anim,
              item: deletedTasks,
              index: index,
              isPersonal:
                  (deletedTasks.type ?? TaskType.personal) == TaskType.personal,
              onClickRemove: () => removeTask(index),
            ),
          );
          taskList.removeAt(
            index,
          );
        }
      }
    } catch (e) {
      DebugUtils.print(
        className: 'removeTask',
        message: '$e',
      );
    }
  }

  void updateState(int index) async {
    if (!_isUpdating) {
      try {
        _isUpdating = true;
        var _newTask = taskList.elementAt(
          index,
        );
        _newTask.isDone = !(_newTask.isDone ?? false);
        final _result = await _repository.update(
          _newTask,
        );
        if (_result) {
          _taskList[index] = _newTask;
        }
      } catch (e) {
        DebugUtils.print(
          className: 'updateState',
          message: '$e',
        );
      }
      _isUpdating = false;
    }
  }
}
