import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/custom_textstyles.dart';

class PostInteractions extends StatelessWidget {
  const PostInteractions({
    super.key,
    this.onTap,
    required this.interactions,
    required this.icon,
    this.child,
  });
  final Function()? onTap;
  final String interactions, icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child:
              child ?? SvgPicture.asset(icon, width: 17.5.sp, height: 17.5.sp),
        ),
        SizedBox(width: 5.w),
        Text(interactions, style: bodyMedium.copyWith(fontSize: 10.sp)),
      ],
    );
  }
}
