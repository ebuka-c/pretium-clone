import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretium_clone/constants/app_svgs.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_textstyles.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 4.h,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppSvgs.link, width: 11.sp, height: 11.sp),
            SizedBox(width: 5.w),
            Text(
              'oliviastores.com/james_haye',
              style: bodySmall.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppSvgs.location, width: 12.sp, height: 12.sp),
            SizedBox(width: 5.w),
            Text(
              'Lagos, Nigeria',
              style: bodySmall.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppSvgs.calendar, width: 12.sp, height: 12.sp),
            SizedBox(width: 5.w),
            Text(
              'Joined May 2025',
              style: bodySmall.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
