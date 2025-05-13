import 'package:intl/intl.dart';

Map<String, String> formatDateTime(String dateTimeString) {
  DateTime dateTime =
      DateTime.parse(dateTimeString).toLocal(); // Convert to local time

  return {
    "date": DateFormat('dd-MMM-yyyy').format(dateTime), // Format as 26-03-2025
    "time":
        DateFormat('h:mma').format(dateTime).toLowerCase(), // Format as 5:51pm
  };
}

//
String timeAgo(String isoTimestamp) {
  DateTime date = DateTime.parse(isoTimestamp);
  Duration diff = DateTime.now().difference(date);

  if (diff.inDays < 14) {
    // For less than 2 weeks, always show days
    if (diff.inDays <= 0) {
      return 'today';
    }
    return diff.inDays == 1 ? '1 day ago' : '${diff.inDays} days ago';
  }

  // For 2 weeks or more, show weeks, months, or years
  if (diff.inDays < 30) {
    int weeks = (diff.inDays / 7).floor();
    return weeks == 1 ? '1 week ago' : '$weeks weeks ago';
  }
  if (diff.inDays < 365) {
    int months = (diff.inDays / 30).floor();
    return months == 1 ? '1 month ago' : '$months months ago';
  }
  int years = (diff.inDays / 365).floor();
  return years == 1 ? '1 year ago' : '$years years ago';
}
