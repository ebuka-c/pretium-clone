class DateTimeHelper {
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  static bool isSameDate(DateTime other, DateTime thiss) {
    return thiss.year == other.year &&
        thiss.month == other.month &&
        thiss.day == other.day;
  }
}
