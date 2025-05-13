import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_colors.dart';
import '../../constants/custom_textstyles.dart';

class DropdownbtnFormfield extends StatefulWidget {
  const DropdownbtnFormfield({
    super.key,
    this.onChanged,
    this.value,
    this.hintText,
    this.fillColor,
    this.items,
    this.filled,
    this.enabledBorderWidth,
    this.focusedBorderWidth,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.radius,
    this.hintStyle,
    this.validator,
    this.suffixIcon,
    this.titleStyle,
    this.margin,
    this.border,
    this.borderSide,
    this.dropdownStyle,
    this.leftContentPadding,
  });
  final void Function(String?)? onChanged;
  final String? value, hintText;
  final List? items;
  final bool? filled;
  final double? enabledBorderWidth,
      focusedBorderWidth,
      radius,
      leftContentPadding;
  final Color? enabledBorderColor, focusedBorderColor, fillColor;
  final TextStyle? hintStyle, titleStyle, dropdownStyle;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? margin;
  final InputBorder? border;
  final BorderSide? borderSide;

  @override
  State<DropdownbtnFormfield> createState() => _DropdownbtnFormfieldState();
}

class _DropdownbtnFormfieldState extends State<DropdownbtnFormfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: widget.height,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: Color(0xffF5F9FE),
        border: Border.all(color: AppColors.btnBorder, width: 1.5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropdownButtonFormField<String>(
        value: widget.value,
        alignment: AlignmentDirectional.bottomEnd,
        hint: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.hintText ?? '',
            style: bodyMedium.copyWith(fontWeight: FontWeight.w300),
          ),
        ),
        onChanged: widget.onChanged,
        validator:
            widget.validator ??
            (value) => value == null ? 'Field Required' : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        items:
            widget.items?.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: bodyMedium),
              );
            }).toList(),
        isExpanded: true,
        dropdownColor: AppColors.white,
        isDense: true,
        style: titleSmall.copyWith(color: AppColors.secondaryText),
        decoration: InputDecoration(
          filled: widget.filled ?? true,
          contentPadding: EdgeInsets.only(
            left: widget.leftContentPadding ?? 30.w,
            right: 10,
          ),
          fillColor: widget.fillColor ?? AppColors.white,
          border: widget.border ?? InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.red),
            borderRadius: BorderRadius.circular(widget.radius ?? 15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.red),
            borderRadius: BorderRadius.circular(widget.radius ?? 15.sp),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: widget.borderSide ?? BorderSide.none,
            borderRadius: BorderRadius.circular(widget.radius ?? 15.sp),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: widget.borderSide ?? BorderSide.none,
            borderRadius: BorderRadius.circular(widget.radius ?? 15.sp),
          ),
          hintText: widget.hintText,
          hintStyle:
              widget.hintStyle ??
              bodyMedium.copyWith(color: AppColors.secondaryText),
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
