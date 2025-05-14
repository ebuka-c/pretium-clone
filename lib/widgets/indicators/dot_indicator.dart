import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: isActive ? 8.5 : 8,
      width: isActive ? 30 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
