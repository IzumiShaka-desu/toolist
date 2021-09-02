import 'package:get/get.dart';
import 'package:toolist/app/data/providers/remote_tasks_provider.dart';
import 'package:toolist/app/data/repository/tasks_repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut(
      () => TasksRepository(),
    );
    Get.lazyPut(
      () => RemoteTasksProvider(),
    );
  }
}
