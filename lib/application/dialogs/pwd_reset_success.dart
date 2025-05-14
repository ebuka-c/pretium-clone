import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/main.dart' show navigatorKey;
import 'package:pretium_clone/routes/names.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_textstyles.dart';
import '../../widgets/buttons/app_button.dart';

Future<void> pwdResetSuccessDialog() async {
  final context = navigatorKey.currentContext!;

  return showDialog(
    context: context,
    barrierDismissible: false,

    builder:
        (_) => AlertDialog(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 20.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.sp)),
          ),
          backgroundColor: AppColors.white,
          content: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Password Reset Successful',
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontFamily: 'robotoBold'),
                ),
                SizedBox(height: 10.h),
                Icon(
                  Icons.check_circle_outline,
                  color: AppColors.teal,
                  size: 50.sp,
                ),
                SizedBox(height: 15.h),
                Text(
                  'Your password has been reset successfully. Please login with your new password.',
                  textAlign: TextAlign.center,
                  style: bodyMedium.copyWith(color: AppColors.grey),
                ),
                SizedBox(height: 20.h),
                AppButton(
                  isOutline: false,
                  boxShadow: true,
                  height: 44.h,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.signIn,
                      (route) => false,
                    );
                  },
                  btnRadius: 10,
                  isAuth0: false,
                  text: 'Login',
                ),
              ],
            ),
          ),
        ),
  );
}
