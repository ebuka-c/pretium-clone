import 'package:flutter/material.dart';
import 'package:pretium_clone/constants/locals.dart';
import '../../constants/app_colors.dart';
import '../../constants/custom_textstyles.dart';
import 'appbar_leading.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final fName = getStorageInstance.read(F_NAME);
    return AppBar(
      backgroundColor: AppColors.primary,
      leading: AppBarLeading(
        inAppbar: true,
        isOnline: true,
        firstLetter: fName[0],
      ),
      centerTitle: true,
      title: Text(
        'Hello, $fName 👋',
        style: titleSmall.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none_outlined),
          color: AppColors.white,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
