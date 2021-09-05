class Tasks {
  String? id;
  String? taskName;
  String? dueDate;
  bool? isDone;
  String? uid;
  TaskType? type;

  Tasks(
      {this.id, this.taskName, this.dueDate, this.isDone, this.uid, this.type});

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskName = json['task_name'];
    dueDate = json['due_date'];
    isDone = json['isDone'];
    uid = json['uid'];
    type = json['type'] == null
        ? null
        : json['type'] == TaskType.personal.toString().split('.').last
            ? TaskType.personal
            : TaskType.business;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['task_name'] = taskName;
    data['due_date'] = dueDate;
    data['isDone'] = isDone;
    data['uid'] = uid;
    data['type'] = type == null ? null : type!.toString().split('.').last;
    return data;
  }
}

enum TaskType { personal, business }
