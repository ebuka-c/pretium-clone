import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/application/authentication/signIn/bloc/sign_in_bloc.dart';
import 'package:pretium_clone/routes/names.dart';
import 'package:pretium_clone/utils/validators.dart';
import 'package:pretium_clone/widgets/snackbar/snackbar.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_textstyles.dart';
import '../../../widgets/buttons/app_button.dart';
import '../../../widgets/textfield/auth_textfield.dart';

final _fNameC = TextEditingController();
final _lNameC = TextEditingController();
final _emailC = TextEditingController();
final _pwdC = TextEditingController();

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'robotoBold',
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 267.w,
                  child: Text(
                    'Simplify your crypto payments with us',
                    textAlign: TextAlign.center,
                    style: bodySmall.copyWith(color: AppColors.grey),
                  ),
                ),
                SizedBox(height: 35.h),
                AuthTextField(
                  controller: _fNameC,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  label: 'First Name',
                  hintText: 'Enter your first name',
                  textCapitalization: TextCapitalization.words,
                  bottomMargin: 16.h,
                  validator: AppValidators.validateFirstName,
                  hasConstraints: false,
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 22.h),
                AuthTextField(
                  controller: _lNameC,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  label: 'Last Name',
                  hintText: 'Enter your last name',
                  textCapitalization: TextCapitalization.words,
                  bottomMargin: 16.h,
                  validator: AppValidators.validateLastName,
                  hasConstraints: false,
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 22.h),
                AuthTextField(
                  controller: _emailC,
                  keyboardType: TextInputType.name,
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
                      hintText: 'Create a password',
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
                  children: [
                    BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) {
                        return Checkbox(
                          value: state.acceptTC,
                          onChanged: (value) {
                            context.read<SignInBloc>().add(
                              ToggleAcceptTCEvent(),
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
                      'Accept terms and conditions',
                      style: bodySmall.copyWith(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                AppButton(
                  isOutline: false,
                  boxShadow: true,
                  onTap: () {
                    bool acceptTC = context.read<SignInBloc>().state.acceptTC;

                    if (formKey.currentState?.validate() ?? false) {
                      if (acceptTC) {
                        //go to verify
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.verifyAccount);
                      } else {
                        //will take care of this
                        showRememberMeSnackbar(context);
                      }
                    }
                  },
                  btnRadius: 14,
                  isAuth0: false,
                  text: 'Create Account',
                ),
                SizedBox(height: 30.h),

                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: bodySmall.copyWith(
                          color: AppColors.secondaryText,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap =
                                  () => Navigator.of(
                                    context,
                                  ).pushNamedAndRemoveUntil(
                                    AppRoutes.signIn,
                                    (route) => false,
                                  ),
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
