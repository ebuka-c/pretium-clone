import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/constants/app_colors.dart';
import 'package:pretium_clone/constants/custom_textstyles.dart';
import 'package:pretium_clone/widgets/header/home_appbar.dart';

import '../../../widgets/cards/balance_card.dart';
import '../../bottomsheets/pick_country.dart';
import 'bloc/home_bloc.dart';

List _nigServices = ['Opay', 'Moniepoint', 'Palmpay', 'Airtime'];

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
              Container(
                width: double.infinity,
                height: 180.h,
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Financial Services',
                          style: bodySmall.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () => pickCountry(context),
                              child: Row(
                                children: [
                                  Text(
                                    state.selectedCountry,
                                    style: bodySmall.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          const cols = 3;
                          final hSpacing = 20.w;
                          final vSpacing = 11.h;
                          final totalHSpacing = hSpacing * (cols - 1);
                          final itemWidth =
                              (constraints.maxWidth - totalHSpacing) / cols;

                          return Wrap(
                            spacing: hSpacing,
                            runSpacing: vSpacing,
                            children: List.generate(_nigServices.length, (
                              index,
                            ) {
                              final service = _nigServices[index];
                              return SizedBox(
                                width: itemWidth,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 2.3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primary.withValues(
                                            alpha: 0.15,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            service[0],
                                            style: bodySmall.copyWith(
                                              fontSize: 11.sp,
                                              color: AppColors.secondaryText,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      service,
                                      textAlign: TextAlign.center,
                                      style: bodySmall.copyWith(
                                        color: AppColors.secondaryText,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
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
