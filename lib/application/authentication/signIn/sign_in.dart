import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/constants/app_colors.dart';
import 'package:pretium_clone/constants/app_svgs.dart';
import 'package:pretium_clone/routes/names.dart';

import '../../../constants/custom_textstyles.dart';
import '../../../widgets/buttons/app_button.dart';
import '../../../widgets/textfield/auth_textfield.dart';
import 'bloc/sign_in_bloc.dart';

final _emailC = TextEditingController();
final _pwdC = TextEditingController();

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                'Sign In',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 267.w,
                child: Text(
                  'Login with your credential to gain access into your account feed.',
                  textAlign: TextAlign.center,
                  style: bodySmall,
                ),
              ),
              SizedBox(height: 24.h),

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
                    bottomMargin: 0,
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
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamed(AppRoutes.otpEmailVerification);
                  },
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.center,
                    style: bodySmall.copyWith(color: AppColors.secondaryText),
                  ),
                ),
              ),
              AppButton(
                isOutline: false,
                boxShadow: true,
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.homeScreen,
                    (Route<dynamic> route) => false,
                  );
                },
                btnRadius: 14,
                isAuth0: false,
                text: 'Login',
              ),
              SizedBox(height: 10.h),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(color: AppColors.divider, endIndent: 12),
                  ),
                  Text(
                    'Or',
                    style: bodySmall.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.grey,
                    ),
                  ),
                  Expanded(
                    child: Divider(color: AppColors.divider, indent: 12),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      isOutline: false,
                      boxShadow: false,
                      btnColor: AppColors.authfield,
                      svgString: AppSvgs.fbIcon,
                      onTap: () {},
                      btnRadius: 14,
                      mode: 'Facebook',
                      textColor: AppColors.secondaryText,
                      fontSize: 12.sp,
                      isAuth0: true,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: AppButton(
                      isOutline: false,
                      boxShadow: false,
                      btnColor: AppColors.authfield,
                      svgString: AppSvgs.googleIcon,
                      onTap: () {},
                      btnRadius: 14,
                      mode: 'Google',
                      textColor: AppColors.secondaryText,
                      fontSize: 12.sp,
                      isAuth0: true,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 22.h),
            ],
          ),
        ),
      ),
    );
  }
}
