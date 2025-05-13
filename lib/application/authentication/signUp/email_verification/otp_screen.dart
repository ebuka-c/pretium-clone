import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/custom_textstyles.dart';
import '../../../../utils/validators.dart';
import '../../../../widgets/buttons/app_button.dart';

class OtpEmailVerification extends StatelessWidget {
  OtpEmailVerification({super.key});
  String? correctOtp = "";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter OTP',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 267.w,
                child: Text(
                  'Enter the OTP code we just sent you on your registered email address.',
                  textAlign: TextAlign.center,
                  style: bodySmall,
                ),
              ),
              SizedBox(height: 16.h),
              Pinput(
                length: 5,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                errorTextStyle: bodySmall.copyWith(color: AppColors.maroon),
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                defaultPinTheme: PinTheme(
                  height: 70.h,
                  width: 56.w,
                  textStyle: titleSmall.copyWith(fontWeight: FontWeight.w500),
                  decoration: BoxDecoration(
                    color: AppColors.authfield,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.btnBorder),
                  ),
                ),
                validator: AppValidators.validatePin,
                onCompleted: (value) {
                  correctOtp = value;

                  // verify email
                  // context.read<SignUpBloc>().add(
                  //   ConfirmEmailVerificationEvent(
                  //     email: state.email ?? "",
                  //     otp: value,
                  //   ),
                  // );
                },
              ),
              SizedBox(height: 100.h),
              AppButton(
                isOutline: false,
                boxShadow: true,
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {}
                },
                btnRadius: 14,
                isAuth0: false,
                text: 'Verify account',
              ),
              SizedBox(height: 22.h),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn\'t get OTP? ',
                      style: bodySmall.copyWith(color: AppColors.secondaryText),
                    ),
                    TextSpan(
                      text: 'Resend OTP',
                      style: bodySmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
