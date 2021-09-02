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
}
