import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_colors.dart';
import '../../constants/custom_textstyles.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    this.onTap,
    this.focusNode,
    this.prefixIcon,
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
    this.onFieldSubmitted,
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
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final InputBorder? errorBorder, focusedBorder, enabledBorder;
  final int? maxlines, minLines;
  final String? label;
  final bool hasConstraints;
  final void Function(String)? onFieldSubmitted;

  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      cursorWidth: 1,
      cursorColor: AppColors.secondaryText,
      readOnly: readOnly ?? false,
      validator: validator,
      decoration: InputDecoration(
        prefixText: prefixText,
        filled: false,
        fillColor: AppColors.authfield,
        hintText: hintText ?? '',
        contentPadding: EdgeInsets.only(left: 30.w, right: 10),
        label: Text(
          '$label ',
          style: bodyMedium.copyWith(color: AppColors.primary),
        ),
        hintStyle: hintStyle ?? bodyMedium.copyWith(color: AppColors.grey),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary, width: 1.0),
        ),
        labelStyle: TextStyle(color: AppColors.primary.withValues(alpha: 0.6)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: bordersideColor ?? AppColors.maroon,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
            ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: bordersideColor ?? AppColors.maroon,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        errorStyle: bodySmall.copyWith(
          color: AppColors.maroon,
          fontSize: 11.sp,
        ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 0.5),
            ),

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
    );
  }
}
