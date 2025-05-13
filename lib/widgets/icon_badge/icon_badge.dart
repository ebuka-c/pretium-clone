import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_colors.dart';
import '../../constants/custom_textstyles.dart';

class IconBadge extends StatelessWidget {
  final Function()? onTap;
  final int count;
  const IconBadge({super.key, required this.onTap, required this.count});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(width: 30.sp, height: 30.sp),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Icon(Icons.notifications_none, size: 26.sp),
          ),
          count > 0
              ? Positioned(
                left: count > 9 ? 14.0.w : 14.0.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: count > 9 ? 1.5.w : 5.0.w,
                    vertical: 2.0.h,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.red,
                  ),
                  child: Text(
                    count > 9 ? '9+' : count.toString(),
                    style: TextStyle(
                      fontSize: 8.0.w,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
              : Positioned(
                left: count > 9 ? 14.0.w : 14.0.w,
                child: Container(),
              ),
        ],
      ),
    );
  }
}

class CountWidget extends StatelessWidget {
  const CountWidget({
    super.key,
    required this.count,
    required this.countBackColor,
  });

  final int count;
  final Color countBackColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(count > 9 ? 2.5.w : 7.0.w),
      decoration: BoxDecoration(shape: BoxShape.circle, color: countBackColor),
      child: Text(
        count > 9 ? '9+' : count.toString(),
        style: bodySmall.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
    );
  }
}
