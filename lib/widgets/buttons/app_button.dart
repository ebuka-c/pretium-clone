import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_textstyles.dart';
import '../indicators/app_loader.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onTap,
    this.text,
    this.width,
    this.margin,
    this.height,
    required this.isOutline,
    this.textColor,
    this.btnColor,
    this.btnRadius,
    this.textStyle,
    this.padding,
    this.borderWidth,
    this.btnChild,
    this.isLoading,
    required this.boxShadow,
    this.fontSize,
    this.borderColor,
    this.svgString,
    this.mode,
    required this.isAuth0,
  });
  final Function()? onTap;
  final String? text, svgString, mode;
  final double? height, btnRadius;
  final double? width, borderWidth, fontSize;
  final bool isOutline, isAuth0;
  final bool? isLoading;
  final Color? textColor, btnColor, borderColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding, margin;
  final Widget? btnChild;
  final bool boxShadow;

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 48.h,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          boxShadow:
              boxShadow
                  ? [
                    BoxShadow(
                      color: AppColors.shadow,
                      offset: Offset(0, 6.1),
                      blurRadius: 16.77,
                    ),
                  ]
                  : null,
          color: !isOutline ? btnColor ?? AppColors.primary : null,
          border:
              isOutline
                  ? Border.all(
                    color: borderColor ?? AppColors.btnBorder,
                    width: borderWidth ?? 1.5,
                  )
                  : null,
          borderRadius: BorderRadius.circular(
            isOutline ? (btnRadius ?? 14) : (btnRadius ?? 10),
          ),
        ),
        child: Center(
          child:
              btnChild ??
              ((isLoading ?? false)
                  ? const AppLoadingIndicator()
                  : ((isOutline || isAuth0)
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (isAuth0)
                            SvgPicture.asset(
                              svgString ?? '',
                              width: 18.sp,
                              height: 18.sp,
                            ),
                          SizedBox(width: 10.w),
                          Text(
                            '$mode',
                            style: bodySmall.copyWith(
                              color: textColor,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                      : Text(
                        text ?? '',
                        style:
                            textStyle ??
                            bodyMedium.copyWith(
                              color: textColor ?? AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize,
                            ),
                      ))),
        ),
      ),
    );
  }
}
