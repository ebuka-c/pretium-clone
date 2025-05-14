import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/constants/app_colors.dart';
import 'package:pretium_clone/constants/custom_textstyles.dart';

import '../../../widgets/iconbox/iconbox.dart';
import '../../application/user/home/bloc/home_bloc.dart';

class BalanceCardWidget extends StatelessWidget {
  const BalanceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(22.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [AppColors.darkPrimary1, AppColors.darkPrimary],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.02, 0.8],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              IconBox(
                iconsize: 22.sp,
                padding: 6.sp,
                containerRadius: 8,
                boxColor: AppColors.white.withValues(alpha: 0.2),
                iconColor: AppColors.white,
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return IconBox(
                    onTap: () {
                      context.read<HomeBloc>().add(ToggleBalanceHideEvent());
                    },
                    iconsize: 20.sp,
                    padding: 5.sp,
                    containerRadius: 50,
                    icon:
                        state.hideBalance
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                    boxColor: AppColors.white.withValues(alpha: 0.2),
                    iconColor: AppColors.white,
                  );
                },
              ),
            ],
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (!state.hideBalance) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    Text(
                      'Wallet Balance',
                      style: bodySmall.copyWith(
                        color: AppColors.white.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(
                          'NGN ',
                          style: bodySmall.copyWith(
                            color: AppColors.white.withValues(alpha: 0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '0.00',
                          style: titleMedium.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    IntrinsicWidth(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.sp,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            '\$ 0.00',
                            style: bodySmall.copyWith(
                              color: AppColors.white.withValues(alpha: 0.6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 22.h),
                    Text(
                      'Wallet Balance',
                      style: bodySmall.copyWith(
                        color: AppColors.white.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          'NGN ',
                          style: bodySmall.copyWith(
                            color: AppColors.white.withValues(alpha: 0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '****',
                          style: titleMedium.copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
