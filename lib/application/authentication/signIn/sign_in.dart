import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/constants/app_colors.dart';
import 'package:pretium_clone/routes/names.dart';
import 'package:pretium_clone/utils/validators.dart';

import '../../../constants/custom_textstyles.dart';
import '../../../widgets/buttons/app_button.dart';
import '../../../widgets/iconbox/iconbox.dart';
import '../../../widgets/textfield/auth_textfield.dart';
import 'bloc/sign_in_bloc.dart';

final _emailC = TextEditingController();
final _pwdC = TextEditingController();

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 80.h, 24.w, 0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconBox(),
                SizedBox(height: 20.h),
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'robotoBold',
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 267.w,
                  child: Text(
                    'Sign in to continue',
                    textAlign: TextAlign.center,
                    style: bodySmall.copyWith(color: AppColors.grey),
                  ),
                ),
                SizedBox(height: 35.h),
                AuthTextField(
                  controller: _emailC,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  label: 'Email',
                  hintText: 'Enter your email',
                  bottomMargin: 16.h,
                  validator: AppValidators.validateEmail,
                  hasConstraints: false,
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 22.h),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    return AuthTextField(
                      controller: _pwdC,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: state.pwdObscure,
                      label: 'Password',
                      hintText: 'Enter your password',
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
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        BlocBuilder<SignInBloc, SignInState>(
                          builder: (context, state) {
                            return Checkbox(
                              value: state.rememberMe,
                              onChanged: (value) {
                                context.read<SignInBloc>().add(
                                  ToggleRememberMeEvent(),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                            );
                          },
                        ),
                        Text(
                          'Remember Me',
                          style: bodySmall.copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.forgotPwd);
                      },
                      child: Text(
                        'Forgot Password?',
                        textAlign: TextAlign.center,
                        style: bodySmall.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
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
