import 'package:flutter/foundation.dart';

class AppValidators {
  AppValidators._();

  static String? validateEmptyField(String? text) {
    if ((text ?? '').isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  static String? validateMaxChar(String? text) {
    if ((text ?? '').isEmpty) {
      return 'Field cannot be empty';
    }

    if ((text?.trim().length ?? 0) > 100) {
      return 'should not exceed 100 characters';
    }

    if (kDebugMode) print(text?.length);
    return null;
  }

  //EMAIL VALIDATOR
  static String? validateEmail(String? value) {
    // Regular expression for a valid email
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value!)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? validateRecoveryEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a valid email address';
    }

    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static bool isButtonPressed = false;

  static String? validatePin(String? pin) {
    if (pin == null || pin.isEmpty) {
      return 'Please enter PIN';
    }
    if (pin.length < 5) {
      return 'PIN must be at least 5 digits';
    }

    return null;
  }

  static void verifyPin() {
    isButtonPressed = true;
  }

  static String? pswdValidator(String? value) {
    RegExp strongPwsdRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[A-Z]).{6,}$');
    if (value!.isEmpty) {
      return 'Password field must not be empty';
    } else {
      if (!strongPwsdRegex.hasMatch(value)) {
        return 'Not Strong Enough. Must contain: \n- uppercase letter\n- lower case letter\n- Be atleast 6 characters long';
      } else {
        return null;
      }
    }
  }

  static String? validateNewPwd(String? value) {
    RegExp strongPwsdRegex = RegExp(
      r'^(?=.*[!@#$%^&*(),.?":{}|<>])(?=.*[a-z])(?=.*[A-Z]).{8,}$',
    );
    if (value!.isEmpty) {
      return 'Password field must not be empty';
    } else {
      if (!strongPwsdRegex.hasMatch(value)) {
        return 'Must contain: \n- uppercase letter\n- lower case letter\n- Be atleast 8 characters long';
      } else {
        return null;
      }
    }
  }
}
