import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/custom_textstyles.dart';
import '../../constants/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.inputBorder,
    this.maxLines,
    this.hintStyle,
    this.contentPadding,
    this.cursorColor,
    this.cursorHeight,
    this.textStyle,
    this.focusedBorder,
    this.padding,
    this.onChanged,
    this.enabledWidth,
    this.autoFocus,
    this.radius,
    this.focusedWidth,
    this.boxShadow,
    this.borderColor,
    this.height,
    this.textCap,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle, textStyle;
  final EdgeInsetsGeometry? contentPadding, padding;
  final String? hintText;
  final Color? fillColor, cursorColor, borderColor;
  final Widget? suffixIcon, prefixIcon;
  final InputBorder? inputBorder, focusedBorder;
  final int? maxLines;
  final double? cursorHeight, enabledWidth, radius, focusedWidth, height;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final List<BoxShadow>? boxShadow;
  final bool? autoFocus;
  final TextCapitalization? textCap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height ?? 44.0.h,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: boxShadow,
      ),
      child: TextFormField(
        onChanged: onChanged,
        style: textStyle ?? bodyLarge,

        keyboardType: keyboardType,
        textCapitalization: textCap ?? TextCapitalization.none,
        cursorColor: cursorColor,
        autofocus: autoFocus ?? false,
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        controller: controller,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius ?? 15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius ?? 15),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius ?? 15),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius ?? 15),
          ),
          hintText: hintText, // hint Text
          contentPadding:
              contentPadding ?? EdgeInsets.symmetric(vertical: 5.0.h),
          hintStyle: hintStyle ?? bodySmall.copyWith(color: AppColors.hintText),
          fillColor: fillColor ?? AppColors.white,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          filled: true,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Field required";
          }
          return null;
        },
      ),
    );
  }
}
