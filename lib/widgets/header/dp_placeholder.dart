import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/app_colors.dart';

class UserDPWidget extends StatelessWidget {
  const UserDPWidget({
    super.key,
    required this.imageUrl,
    required this.isOnline,
    required this.inAppbar,
    this.size,
  });
  final String imageUrl;
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
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: CachedNetworkImage(
              key: UniqueKey(),
              imageUrl: imageUrl,
              placeholder: (context, url) => DPPlaceholder(),
              errorWidget: (context, url, error) => DPPlaceholder(),
              fit: BoxFit.cover,
            ),
          ),
          isOnline
              ? Container(
                width: 8.h,
                height: 8.h,
                margin: EdgeInsets.all(1.sp),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white),
                ),
              )
              : SizedBox(),
        ],
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
