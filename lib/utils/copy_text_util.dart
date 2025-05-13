import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

copyTextToClipboard(
  BuildContext context, {
  required String textToCopy,
  required String message,
}) {
  Clipboard.setData(ClipboardData(text: textToCopy));
  // appSnackBar(context, message: message, type: 1);
}
