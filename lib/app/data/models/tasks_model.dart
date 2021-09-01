class Tasks {
  String? id;
  String? taskName;
  String? dueDate;
  bool? isDone;
  String? uid;

  Tasks({this.id, this.taskName, this.dueDate, this.isDone, this.uid});

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskName = json['task_name'];
    dueDate = json['due_date'];
    isDone = json['isDone'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['task_name'] = taskName;
    data['due_date'] = dueDate;
    data['isDone'] = isDone;
    data['uid'] = uid;
    return data;
  }
}
