import 'package:get/get.dart';
import 'package:toolist/app/data/models/tasks_model.dart';
import 'package:toolist/app/data/providers/remote_tasks_provider.dart';

class TasksRepository {
  final RemoteTasksProvider _remoteTasksProvider = Get.find();
  Future<bool> add(Tasks newTask) async => _remoteTasksProvider.add(
        newTask,
      );
  Future<bool> update(Tasks newTask) async => _remoteTasksProvider.update(
        newTask,
      );
  Future<bool> delete(String idTask) async => _remoteTasksProvider.delete(
        idTask,
      );
  Future<List<Tasks>> getList() async => _remoteTasksProvider.get();
}
