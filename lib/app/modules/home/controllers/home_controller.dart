import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/utils/debug_utils.dart';
import 'package:toolist/app/data/models/tasks_model.dart';
import 'package:toolist/app/data/repository/tasks_repository.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  final TasksRepository _repository = Get.find();

  final _taskList = <Tasks>[].obs;
  List<Tasks> get taskList => _taskList;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late final TabController _controller;
  TabController get tabController => _controller;

  final _pages = [Container(), Container()];
  List<Widget> get pages => _pages;

  final _isMenuOpened = false.obs;
  bool get isMenuOpened => _isMenuOpened.value;

  void openMenu() => _isMenuOpened.value = true;
  void closeMenu() => _isMenuOpened.value = false;

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
}
