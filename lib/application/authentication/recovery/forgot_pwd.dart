import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretium_clone/constants/locals.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_textstyles.dart';
import '../../../utils/validators.dart';
import '../../../widgets/buttons/app_button.dart';
import '../../../widgets/textfield/auth_textfield.dart';
import '../../dialogs/code_sent.dart';

final _emailC = TextEditingController();

class ForgotPwd extends StatelessWidget {
  ForgotPwd({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'robotoBold',
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: screenWidth - 80.w,
                  child: Text(
                    'Enter your email to receive a password reset code',
                    textAlign: TextAlign.left,
                    style: bodySmall.copyWith(color: AppColors.grey),
                  ),
                ),
                SizedBox(height: 35.h),
                AuthTextField(
                  controller: _emailC,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  label: 'Email',
                  hintText: 'Enter your email',
                  bottomMargin: 16.h,
                  validator: AppValidators.validateEmail,
                  hasConstraints: false,
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 30.h),
                AppButton(
                  isOutline: false,
                  boxShadow: true,
                  onTap: () async {
                    await getStorageInstance.write(EMAIL, _emailC.text.trim());

                    if (formKey.currentState?.validate() ?? false) {
                      codeSentDialog();
                    }
                  },
                  btnRadius: 14,
                  isAuth0: false,
                  text: 'Sent Reset Code',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
