import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class IconBox extends StatelessWidget {
  const IconBox({
    super.key,
    this.boxColor,
    this.icon,
    this.iconsize,
    this.iconColor,
    this.padding,
    this.containerRadius,
    this.onTap,
  });
  final Color? boxColor, iconColor;
  final IconData? icon;
  final double? iconsize, padding, containerRadius;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding ?? 12.sp),
        decoration: BoxDecoration(
          color: boxColor ?? AppColors.secondary,
          borderRadius: BorderRadius.circular(containerRadius ?? 15),
        ),
        child: Icon(
          icon ?? Icons.account_balance_wallet,
          color: iconColor ?? AppColors.primary,
          size: iconsize ?? 30.sp,
        ),
      ),
    );
  }
}
