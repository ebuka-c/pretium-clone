import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/constants/app_colors.dart';
import 'package:pretium_clone/constants/custom_textstyles.dart';
import 'package:pretium_clone/routes/names.dart';
import 'package:pretium_clone/widgets/buttons/app_button.dart';

import '../../../widgets/dropdown/dropdownbtn_formfield.dart';

final List<String> _countries = ['Ghana', 'Kenya', 'Uganda'];

class GetStarted extends StatelessWidget {
  GetStarted({super.key});
  String? selectedCountry;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 0.h, 24.w, 0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get Started',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 267.w,
                child: Text(
                  'Select your country to get started with your account creation.',
                  textAlign: TextAlign.center,
                  style: bodySmall,
                ),
              ),
              SizedBox(height: 24.h),
              DropdownbtnFormfield(
                items: _countries,
                hintText: 'Select Country',
                value: selectedCountry,
                onChanged: (val) {
                  selectedCountry = val;
                },
              ),

              SizedBox(height: 16.h),
              AppButton(
                isOutline: false,
                boxShadow: true,
                onTap: () {
                  if (formKey.currentState?.validate() ?? false) {
                    Navigator.of(context).pushNamed(AppRoutes.signUp);
                  }
                },
                isAuth0: false,
                btnRadius: 14,
                text: 'Create an account',
              ),
              SizedBox(height: 22.h),
            ],
          ),
        ),
      ),
    );
  }
}
