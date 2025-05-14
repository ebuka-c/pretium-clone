import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_textstyles.dart';

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({
    super.key,
    required this.isOnline,
    required this.inAppbar,
    required this.firstLetter,
    this.size,
  });
  final String? firstLetter;
  final bool isOnline, inAppbar;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      margin:
          inAppbar
              ? EdgeInsets.symmetric(
                vertical: (kToolbarHeight - 34.h) / 2,
                horizontal: (kToolbarHeight - 34.h) / 2,
              )
              : EdgeInsets.zero,
      decoration: BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
      child: Center(
        child: Text(
          (firstLetter ?? '').toUpperCase(),
          style: titleSmall.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}

class DPPlaceholder extends StatelessWidget {
  const DPPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Iconsax.profile_circle,
      size: 33.sp,
      color: AppColors.secondaryText,
    );
  }
}
