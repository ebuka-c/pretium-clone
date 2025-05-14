import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/utils/input_formatters.dart';
import 'package:pretium_clone/utils/validators.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_textstyles.dart';
import '../../../widgets/buttons/app_button.dart';
import '../../../widgets/textfield/auth_textfield.dart';
import '../../dialogs/pwd_reset_success.dart';
import '../signIn/bloc/sign_in_bloc.dart';

final _codeC = TextEditingController();
final _pwdC = TextEditingController();
final _confirmPwdC = TextEditingController();

FocusNode _codeFocus = FocusNode();
FocusNode _pwdFocus = FocusNode();
FocusNode _confirmFocus = FocusNode();

class ResetPwd extends StatelessWidget {
  ResetPwd({super.key});
  final formKey = GlobalKey<FormState>();

  String? validateConfirmPwd(value) {
    final pwd = _pwdC.text;
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != pwd) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset Password',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'robotoBold',
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: screenWidth - 80.w,
                  child: Text(
                    'Enter the code sent to your email and set a new password',
                    textAlign: TextAlign.left,
                    style: bodySmall.copyWith(color: AppColors.grey),
                  ),
                ),
                SizedBox(height: 35.h),
                AuthTextField(
                  controller: _codeC,
                  focusNode: _codeFocus,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_pwdFocus);
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                    integerInputFormatter,
                  ],
                  obscureText: false,
                  label: 'Reset Code',
                  hintText: 'Enter 4-digit reset code',
                  bottomMargin: 16.h,
                  validator: AppValidators.validateCodeField,
                  hasConstraints: false,
                  prefixIcon: Icon(
                    Icons.lock_reset,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 22.h),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    return AuthTextField(
                      controller: _pwdC,
                      focusNode: _pwdFocus,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_confirmFocus);
                      },
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      obscureText: state.pwdObscure2,
                      label: 'New Password',
                      hintText: 'Enter new password',
                      bottomMargin: 0,
                      hasConstraints: false,
                      validator: AppValidators.validateEmptyPasswordField,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: AppColors.primaryText,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          context.read<SignInBloc>().add(
                            ToggleConfirmPasswordObscureEvent(),
                          );
                        },
                        child: Icon(
                          state.pwdObscure2
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 22.h),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    return AuthTextField(
                      controller: _confirmPwdC,
                      focusNode: _confirmFocus,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: state.pwdObscure,
                      label: 'Confirm Password',
                      hintText: 'Confirm new password',
                      bottomMargin: 0,
                      hasConstraints: false,
                      validator: validateConfirmPwd,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: AppColors.primaryText,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          context.read<SignInBloc>().add(
                            TogglePasswordObscureEvent(),
                          );
                        },
                        child: Icon(
                          state.pwdObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 30.h),
                AppButton(
                  isOutline: false,
                  boxShadow: true,
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      pwdResetSuccessDialog();
                    }
                  },
                  btnRadius: 14,
                  isAuth0: false,
                  text: 'Reset Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
