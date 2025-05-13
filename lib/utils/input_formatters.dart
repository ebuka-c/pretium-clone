import 'package:flutter/services.dart';

class PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow only digits and an optional leading '+'
    String filtered = newValue.text.replaceAll(RegExp(r'[^\d+]'), '');

    // Ensure '+' is only at the start
    if (filtered.contains('+') && filtered.indexOf('+') > 0) {
      filtered = filtered.replaceAll('+', '');
    }

    // Limit to 17 characters (max international phone length)
    if (filtered.length > 17) {
      filtered = filtered.substring(0, 15);
    }

    return TextEditingValue(
      text: filtered,
      selection: TextSelection.collapsed(offset: filtered.length),
    );
  }
}

TextInputFormatter decimalInputFormatter =
    FilteringTextInputFormatter.allow(RegExp(r'^\d*[\.,]?\d*'));

TextInputFormatter integerInputFormatter =
    FilteringTextInputFormatter.digitsOnly;
