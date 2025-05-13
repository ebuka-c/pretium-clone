import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/utils/validators.dart';
import '../../constants/app_colors.dart';
import '../../constants/custom_textstyles.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    this.onTap,
    this.focusNode,
    this.prefix,
    this.inputFormatters,
    required this.controller,
    this.suffixIcon,
    this.label,
    required this.obscureText,
    this.keyboardType,
    this.textCapitalization,
    this.validator,
    this.autovalidateMode,
    this.titleStyle,
    this.prefixText,
    this.hintStyle,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.bordersideColor,
    this.subtitle,
    this.focusedBorderWidth,
    this.textStyle,
    this.hintText,
    this.readOnly,
    this.enabledBorderWidth,
    this.filled,
    required this.bottomMargin,
    this.fieldAction,
    this.minHeight,
    this.maxHeight,
    this.onChanged,
    required this.hasConstraints,
    this.borderRadius,
    this.errorBorder,
    this.focusedBorder,
    this.enabledBorder,
    this.maxlines,
    this.fillColor,
    this.textInputAction,
    this.expands,
    this.minLines,
  });
  final TextEditingController controller;
  final String? subtitle, prefixText;
  final String? hintText;
  final TextStyle? titleStyle, hintStyle, textStyle;
  final Widget? suffixIcon, fieldAction;
  final bool obscureText;
  final bool? filled, readOnly, expands;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final Color? enabledBorderColor,
      focusedBorderColor,
      bordersideColor,
      fillColor;
  final double? focusedBorderWidth,
      enabledBorderWidth,
      minHeight,
      maxHeight,
      borderRadius;
  final double bottomMargin;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final InputBorder? errorBorder, focusedBorder, enabledBorder;
  final int? maxlines, minLines;
  final String? label;
  final bool hasConstraints;

  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.h),
      height: 58.h,
      margin: EdgeInsets.only(bottom: bottomMargin),
      constraints:
          hasConstraints
              ? BoxConstraints(
                minHeight: minHeight ?? 56.0.h,
                maxHeight: maxHeight ?? double.infinity,
              )
              : null,
      decoration: BoxDecoration(
        color: AppColors.authfield,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: TextFormField(
          controller: controller,

          onTap: onTap,
          cursorHeight: 20.h,
          maxLines: maxlines ?? 1,
          minLines: minLines,
          expands: expands ?? false,
          style: textStyle ?? bodyMedium.copyWith(color: AppColors.primaryText),
          onChanged: onChanged,
          keyboardType: keyboardType,
          obscuringCharacter: '*',
          focusNode: focusNode,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          onTapOutside: (PointerDownEvent event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          inputFormatters: inputFormatters,
          cursorWidth: 1,
          cursorColor: AppColors.secondaryText,
          readOnly: readOnly ?? false,
          validator: validator ?? AppValidators.validateEmptyField,
          decoration: InputDecoration(
            prefixText: prefixText,
            filled: filled ?? true,
            fillColor: AppColors.authfield,
            hintText: hintText ?? '',
            contentPadding: EdgeInsets.only(left: 30.w, right: 10),
            label: Text(
              '$label ',
              style: bodyMedium.copyWith(color: AppColors.secondaryText),
            ),

            hintStyle:
                hintStyle ?? bodyMedium.copyWith(color: AppColors.filterText),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius ?? 14),
            ),
            errorBorder:
                errorBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius ?? 14),
                ),
            errorStyle: bodySmall.copyWith(
              color: AppColors.maroon,
              fontSize: 11.sp,
            ),
            enabledBorder:
                enabledBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius ?? 14),
                ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius ?? 14),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius ?? 14),
            ),
            prefix: prefix,
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
