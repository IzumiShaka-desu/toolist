import 'package:get/get.dart';
import 'package:toolist/app/data/models/tasks_model.dart';
import 'package:toolist/app/data/providers/remote_tasks_provider.dart';

class TasksRepository {
  final RemoteTasksProvider _remoteTasksProvider = Get.find();
  Future<bool> add(Tasks newTask) async => _remoteTasksProvider.add(
        newTask,
      );
}
