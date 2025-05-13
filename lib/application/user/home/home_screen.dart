import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pretium_clone/constants/app_colors.dart';
import 'package:pretium_clone/constants/app_svgs.dart';
import '../../../widgets/header/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  void navigateToPage(int pageIndex) {
    pageController?.jumpToPage(pageIndex);
  }

  onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          Container(color: Colors.green),
          Container(color: Colors.green),
          Container(color: Colors.black87),
          Container(color: Colors.deepPurpleAccent),
          Container(color: Colors.indigo),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: Container(
          padding: EdgeInsets.fromLTRB(25.92.w, 14.h, 22.92.w, 14.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: AppColors.shadow2, blurRadius: 20)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  navigateToPage(0);
                },
                child: SvgPicture.asset(
                  AppSvgs.homeicon,
                  width: pageIndex == 0 ? 23.sp : 20.2.sp,
                  height: pageIndex == 0 ? 23.sp : 20.2.sp,
                  colorFilter: ColorFilter.mode(
                    pageIndex == 0 ? AppColors.primary : AppColors.inactive,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  navigateToPage(1);
                },
                child: SvgPicture.asset(
                  AppSvgs.chart,
                  width: pageIndex == 1 ? 23.sp : 20.2.sp,
                  height: pageIndex == 1 ? 23.sp : 20.2.sp,
                  colorFilter: ColorFilter.mode(
                    pageIndex == 1 ? AppColors.primary : AppColors.inactive,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  navigateToPage(2);
                },
                child: SvgPicture.asset(
                  AppSvgs.plusicon,
                  width: pageIndex == 2 ? 23.sp : 20.2.sp,
                  height: pageIndex == 2 ? 23.sp : 20.2.sp,
                  colorFilter: ColorFilter.mode(
                    pageIndex == 2 ? AppColors.primary : AppColors.inactive,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  navigateToPage(3);
                },
                child: SvgPicture.asset(
                  AppSvgs.bell,
                  width: pageIndex == 3 ? 23.sp : 19.75.sp,
                  height: pageIndex == 3 ? 23.sp : 19.75.sp,
                  colorFilter: ColorFilter.mode(
                    pageIndex == 3 ? AppColors.primary : AppColors.inactive,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  navigateToPage(4);
                },
                child: SvgPicture.asset(
                  AppSvgs.mail,
                  width: pageIndex == 4 ? 22.sp : 19.25.sp,
                  height: pageIndex == 4 ? 22.sp : 19.25.sp,
                  colorFilter: ColorFilter.mode(
                    pageIndex == 4 ? AppColors.primary : AppColors.inactive,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
