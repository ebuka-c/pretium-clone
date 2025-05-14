import 'package:flutter/foundation.dart';

class AppValidators {
  AppValidators._();

  static String? validateCodeField(String? text) {
    if ((text ?? '').isEmpty) {
      return 'Please enter the reset code';
    }
    if ((text?.length ?? 0) < 4) {
      return 'Please enter the complete 4-digit code';
    }
    return null;
  }

  static String? validateEmptyPasswordField(String? text) {
    if ((text ?? '').isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  static String? validateEmptyCodeField(String? text) {
    if ((text ?? '').isEmpty) {
      return 'Please enter verification code';
    }
    return null;
  }

  static String? validateFirstName(String? text) {
    if ((text ?? '').isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

  static String? validateLastName(String? text) {
    if ((text ?? '').isEmpty) {
      return 'Please enter your last name';
    }
    return null;
  }

  static String? validateEmptyNewPwdField(String? text) {
    if ((text ?? '').isEmpty) {
      return 'Please enter a new password';
    }
    return null;
  }

  static String? validateEmptyConfirmPwdField(String? text) {
    if ((text ?? '').isEmpty) {
      return 'Please confirm your password';
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
    if (value.isEmpty) {
      return 'Please enter your email';
    }

    return null;
  }

  static String? validatePin(String? pin) {
    if (pin == null || pin.isEmpty) {
      return 'Please enter PIN';
    }
    if (pin.length < 5) {
      return 'PIN must be at least 5 digits';
    }

    return null;
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
}
