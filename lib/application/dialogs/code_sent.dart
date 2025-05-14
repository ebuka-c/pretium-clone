import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/constants/locals.dart';
import 'package:pretium_clone/main.dart' show navigatorKey;
import 'package:pretium_clone/routes/names.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_textstyles.dart';
import '../../widgets/buttons/app_button.dart';

Future<void> codeSentDialog() async {
  final context = navigatorKey.currentContext!;

  final email = getStorageInstance.read(EMAIL);
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
                  'Reset Code Sent',
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
                  'We have sent a password reset code to $email',
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
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.resetPwd);
                  },
                  btnRadius: 10,
                  isAuth0: false,
                  text: 'Continue',
                ),
              ],
            ),
          ),
        ),
  );
}
