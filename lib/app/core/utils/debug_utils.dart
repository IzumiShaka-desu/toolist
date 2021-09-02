import 'dart:developer';

abstract class DebugUtils {
  static void print({
    required String className,
    required String message,
    Priority priority = Priority.low,
    Object? errorObject,
    StackTrace? trace,
  }) =>
      log(
        '$className: $message',
        level: priorityToIntLevel(priority),
        time: DateTime.now(),
        error: errorObject,
        name: className,
        stackTrace: trace,
      );

  static int priorityToIntLevel(Priority priority) {
    switch (priority) {
      case Priority.high:
        return 2;
      case Priority.medium:
        return 1;
      case Priority.low:
        return 0;
    }
  }
}

enum Priority {
  high,
  medium,
  low,
}
