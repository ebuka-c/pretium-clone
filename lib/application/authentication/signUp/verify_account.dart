import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/utils/input_formatters.dart';
import 'package:pretium_clone/widgets/dropdown/dropdownbtn_formfield.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_textstyles.dart';
import '../../../routes/names.dart';
import '../../../utils/validators.dart';
import '../../../widgets/buttons/app_button.dart';
import '../../../widgets/textfield/auth_textfield.dart';

final _pinC = TextEditingController();

class VerifyAccount extends StatelessWidget {
  const VerifyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 30.h, 24.w, 0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.account_balance_wallet,
                    color: AppColors.primary,
                    size: 30.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Verify Account',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'robotoBold',
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 267.w,
                  child: Text(
                    'Enter the verification code sent to your email',
                    textAlign: TextAlign.center,
                    style: bodySmall.copyWith(color: AppColors.grey),
                  ),
                ),
                SizedBox(height: 35.h),
                DropdownbtnFormfield(
                  hintText: 'Select Country',
                  items: [
                    'Kenya',
                    'Uganda',
                    'Nigeria',
                    'Malawi',
                    'Global users',
                  ],
                ),
                SizedBox(height: 22.h),
                AuthTextField(
                  controller: _pinC,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                    integerInputFormatter,
                  ],
                  obscureText: false,
                  suffixIcon: Icon(Icons.shield_outlined),
                  label: '1234',
                  hintText: 'Enter 4-digit code',
                  bottomMargin: 16.h,
                  validator: AppValidators.validateEmptyCodeField,
                  hasConstraints: false,
                ),
                SizedBox(height: 40.h),
                AppButton(
                  isOutline: false,
                  boxShadow: true,
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.homeScreen,
                        (Route<dynamic> route) => false,
                      );
                    }
                  },
                  btnRadius: 14,
                  isAuth0: false,
                  text: 'Login',
                ),
                SizedBox(height: 50.h),

                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: bodySmall.copyWith(
                          color: AppColors.secondaryText,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap =
                                  () => Navigator.of(
                                    context,
                                  ).pushNamed(AppRoutes.signUp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
