import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/constants/app_colors.dart';
import 'package:pretium_clone/constants/custom_textstyles.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.icon,
    required this.heading,
    required this.subheading,
  });
  final IconData icon;
  final String heading;
  final String subheading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary, size: 50.sp),
        ),
        SizedBox(height: 30.h),
        Text(
          heading,
          style: titleSmall.copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: 'robotoBold',
          ),
        ),
        SizedBox(height: 15.h),
        Text(
          subheading,
          textAlign: TextAlign.center,
          style: bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryText,
          ),
        ),
      ],
    );
  }
}
