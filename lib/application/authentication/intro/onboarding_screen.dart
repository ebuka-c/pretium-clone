import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/constants/app_colors.dart';
import 'package:pretium_clone/constants/custom_textstyles.dart';
import 'package:pretium_clone/routes/names.dart';
import 'package:pretium_clone/widgets/buttons/app_button.dart';

import '../../../widgets/indicators/dot_indicator.dart';
import '../../../widgets/onboarding/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  bool isFirstPage = false;

  int pageIndex = 0;

  onChangeIndex(int index) {
    pageIndex = index;
    setState(() {
      if (index == 0) {
        isFirstPage = true;
      }
    });
  }

  void goNext() {
    setState(() {});
    if (!(pageIndex > 1)) {
      pageIndex++;
    }

    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void goPrevious() {
    setState(() {});
    if (!(pageIndex < 0)) {
      pageIndex--;
    }
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLastPage = pageIndex == 2;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 47.sp, horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.signUp,
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text(
                  'Skip',
                  style: bodyMedium.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.secondaryText,
                  ),
                ),
              ),
            ),
            SizedBox(height: 33.h),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  onChangeIndex(index);
                },
                children: [
                  OnboardingContent(
                    icon: Icons.payment,
                    heading: 'Direct Pay',
                    subheading: 'Pay with crypto across Africa effortlessly',
                  ),
                  OnboardingContent(
                    icon: Icons.account_balance_wallet,
                    heading: 'Accept Payments',
                    subheading: 'Accept stablecoin payments hassle-free',
                  ),
                  OnboardingContent(
                    icon: Icons.receipt_long_outlined,
                    heading: 'Pay Bills',
                    subheading: 'Pay for utility services and earn rewards',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // DotIndicator(),
                ...List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: DotIndicator(isActive: index == pageIndex),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            AppButton(
              onTap: () {
                goNext();
              },
              isOutline: false,
              btnRadius: 12,
              text: isLastPage ? 'Get Started' : 'Next',
              boxShadow: false,
              isAuth0: false,
            ),
          ],
        ),
      ),
    );
  }
}
