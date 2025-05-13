import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretium_clone/application/user/home/search_screen.dart';
import 'package:pretium_clone/routes/names.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../constants/app_svgs.dart';
import '../../constants/custom_textstyles.dart';
import 'dp_placeholder.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.profileScreen);
        },
        child: UserDPWidget(
          inAppbar: true,
          imageUrl: AppImages.profileHeader,
          isOnline: true,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Hizina',
        style: titleSmall.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => SearchScreen()));
          },
          child: SvgPicture.asset(AppSvgs.search, width: 20.sp, height: 20.sp),
        ),
        SizedBox(width: 13.w),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
