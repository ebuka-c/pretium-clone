import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

String formatCustomDateTime(DateTime dateTime) {
  var localDateTime = dateTime.toLocal();
  final DateFormat formatter = DateFormat('MMM dd, yyyy \'at\' hh:mm a');
  // Format the DateTime object
  return formatter.format(localDateTime);
}

String formatDateTimeToMonthName() {
  final DateFormat formatter = DateFormat('MMMM');
  var month = formatter.format(DateTime.now());
  if (kDebugMode) print(month);
  return month;
}
