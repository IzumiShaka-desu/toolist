extension DateTimeUtils on DateTime {
  bool get isTomorrow =>
      (day - DateTime.now().day) == 1 &&
      month == DateTime.now().month &&
      year == DateTime.now().year;
  bool get isToday =>
      day == DateTime.now().day &&
      month == DateTime.now().month &&
      year == DateTime.now().year;
}
