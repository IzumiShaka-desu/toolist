import 'package:get/get.dart';
import 'package:toolist/app/core/utils/debug_utils.dart';
import 'package:toolist/app/data/models/tasks_model.dart';
import 'package:toolist/app/data/repository/tasks_repository.dart';

class HomeController extends GetxController {
  final TasksRepository _repository = Get.find();
  final _taskList = <Tasks>[].obs;
  List<Tasks> get taskList => _taskList;
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  @override
  void onInit() {
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
  void onClose() {}
}
