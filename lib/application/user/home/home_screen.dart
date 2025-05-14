import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/constants/app_colors.dart';
import 'package:pretium_clone/constants/custom_textstyles.dart';
import 'package:pretium_clone/widgets/header/home_appbar.dart';

import '../../../widgets/cards/balance_card.dart';
import '../../../widgets/cards/fin_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BalanceCardWidget(),
              SizedBox(height: 10.h),
              FinancialServicesCard(),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent transactions',
                    style: bodySmall.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See all',
                    style: bodySmall.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.receipt_long_outlined,
                        color: AppColors.filterText,
                        size: 25.sp,
                      ),
                      Text(
                        'No recent transactions',
                        style: bodySmall.copyWith(color: AppColors.filterText),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        decoration: BoxDecoration(
          color: AppColors.white,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.account_balance_wallet, color: AppColors.primary),
            Container(
              padding: EdgeInsets.all(7.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
                boxShadow: [BoxShadow(color: AppColors.shadow)],
              ),
              child: Center(
                child: Icon(Icons.qr_code_2, color: AppColors.white),
              ),
            ),
            Icon(Icons.sort, color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}
