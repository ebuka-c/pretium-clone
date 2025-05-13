import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class AppLoadingIndicator extends StatefulWidget {
  const AppLoadingIndicator({super.key, this.size});
  final double? size;

  @override
  State<AppLoadingIndicator> createState() => _AppLoadingIndicatorState();
}

class _AppLoadingIndicatorState extends State<AppLoadingIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animationController?.repeat();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: CircularProgressIndicator(
          valueColor: animationController?.drive(
            ColorTween(end: Colors.blueAccent, begin: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
