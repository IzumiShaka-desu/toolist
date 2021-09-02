import 'package:get/get.dart';
import 'package:supabase/supabase.dart';
import 'package:toolist/app/core/utils/debug_utils.dart';

import '../models/tasks_model.dart';

class RemoteTasksProvider {
  static const _tableName = 'tasks';
  final SupabaseClient _client = Get.find();

  Future<bool> add(Tasks newTask) async {
    final res = await _client
        .from(
          _tableName,
        )
        .upsert(
          newTask,
        )
        .execute();
    if (res.error != null) {
      DebugUtils.print(
        className: 'RemoteTaskProvider',
        message: res.error!.message,
      );
      return false;
    }
    return true;
  }

  Future<bool> update(Tasks newTask) async {
    final data = newTask.toJson();
    data.removeWhere((key, value) => value == null);
    final res = await _client
        .from(
          _tableName,
        )
        .update(
          data,
        )
        .eq(
          'id',
          newTask.id,
        )
        .execute();
    if (res.error != null) {
      DebugUtils.print(
        className: 'RemoteTaskProvider',
        message: res.error!.message,
      );
      return false;
    }
    return true;
  }

  Future<bool> delete(String idTask) async {
    final res = await _client
        .from(
          _tableName,
        )
        .delete()
        .eq(
          'id',
          idTask,
        )
        .execute();
    if (res.error != null) {
      DebugUtils.print(
        className: 'RemoteTaskProvider',
        message: res.error!.message,
      );
      return false;
    }
    return true;
  }
}
