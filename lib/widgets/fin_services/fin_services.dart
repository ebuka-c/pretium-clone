import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/constants/app_colors.dart';
import 'package:pretium_clone/constants/custom_textstyles.dart';

class FinServices extends StatelessWidget {
  const FinServices({super.key, required this.logo});
  final String logo;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary.withValues(alpha: 0.15),
        ),
        child: Center(
          child: Text(
            logo,
            style: bodySmall.copyWith(
              fontSize: 11.sp,
              color: AppColors.secondaryText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
