import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pretium_clone/constants/app_colors.dart';
import 'package:pretium_clone/constants/app_images.dart';
import 'package:pretium_clone/constants/custom_textstyles.dart';
import 'package:pretium_clone/constants/locals.dart';

import '../../../routes/names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  bool hasLoggedInBefore = getStorageInstance.read(HAS_LOGGED_IN) ?? false;

  _goNext() {
    if (hasLoggedInBefore) {
      // go to login
      Navigator.of(context).pushReplacementNamed(AppRoutes.signIn);
    } else {
      // oboarding
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logo),
            Text(
              'PRETIUM',
              style: bodyMedium.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
