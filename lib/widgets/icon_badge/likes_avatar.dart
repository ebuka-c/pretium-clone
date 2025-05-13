import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class LikesAvatar extends StatelessWidget {
  const LikesAvatar({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.sp,
      height: 22.sp,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.divider2,
        border: Border.all(color: AppColors.white, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(500),
        child: CachedNetworkImage(
          key: UniqueKey(),
          imageUrl: imageUrl,
          placeholder: (context, url) => SizedBox(),
          errorWidget: (context, url, error) => SizedBox(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
