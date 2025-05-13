import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/application/authentication/signIn/bloc/sign_in_bloc.dart';
import 'package:pretium_clone/routes/names.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_textstyles.dart';
import '../../../widgets/buttons/app_button.dart';
import '../../../widgets/textfield/auth_textfield.dart';

final _usernameC = TextEditingController();
final _emailC = TextEditingController();
final _pwdC = TextEditingController();
final _confirmPwdC = TextEditingController();

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get Started',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 267.w,
                child: Text(
                  'Fill in your details to create an account.',
                  textAlign: TextAlign.center,
                  style: bodySmall,
                ),
              ),
              SizedBox(height: 24.h),
              AuthTextField(
                controller: _usernameC,
                obscureText: false,
                label: 'Enter Username',
                bottomMargin: 16.h,
                hasConstraints: false,
              ),
              AuthTextField(
                controller: _emailC,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                label: 'Enter Email',
                bottomMargin: 16.h,
                hasConstraints: false,
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  return AuthTextField(
                    controller: _pwdC,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: state.pwdObscure,
                    label: 'Enter Password',
                    bottomMargin: 16.h,
                    hasConstraints: false,
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
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  return AuthTextField(
                    controller: _confirmPwdC,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: state.pwdObscure2,
                    label: 'Confirm Password',
                    bottomMargin: 16.h,
                    hasConstraints: false,
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

              AppButton(
                isOutline: false,
                boxShadow: true,
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(AppRoutes.otpEmailVerification);
                },
                isAuth0: false,
                btnRadius: 14,
                text: 'Create an account',
              ),
              SizedBox(height: 22.h),
            ],
          ),
        ),
      ),
    );
  }
}
