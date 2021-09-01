import 'package:get/get.dart';

import '../models/tasks_model.dart';

class TasksProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Tasks.fromJson(map);
      if (map is List) return map.map((item) => Tasks.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Tasks?> getTasks(int id) async {
    final response = await get('tasks/$id');
    return response.body;
  }

  Future<Response<Tasks>> postTasks(Tasks tasks) async =>
      await post('tasks', tasks);
  Future<Response> deleteTasks(int id) async => await delete('tasks/$id');
}
