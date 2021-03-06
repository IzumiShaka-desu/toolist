import 'package:get/get.dart';
import 'package:toolist/app/data/providers/auth_provider.dart';
import 'package:toolist/app/data/providers/remote_tasks_provider.dart';
import 'package:toolist/app/data/repository/auth_repository.dart';
import 'package:toolist/app/data/repository/tasks_repository.dart';
import 'package:toolist/app/modules/home/controllers/add_task_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AddtaskController>(
      () => AddtaskController(),
    );
    Get.lazyPut(
      () => TasksRepository(),
    );
    Get.lazyPut(
      () => RemoteTasksProvider(),
    );
    Get.lazyPut(
      () => AuthProvider(),
    );
    Get.lazyPut(
      () => AuthRepository(),
    );
  }
}
