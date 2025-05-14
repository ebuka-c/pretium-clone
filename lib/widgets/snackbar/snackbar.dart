import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void acceptTCSnackbar(BuildContext context) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  scaffoldMessenger.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      elevation: 8,
      duration: Duration(seconds: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        children: [
          Row(
            children: [
              // Rotating Alert Icon
              RotatingIcon(),
              SizedBox(width: 12),
              // Message Text
              Expanded(
                child: Text(
                  'Please click on rememberMe',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          LinearProgressIndicator(
            backgroundColor: Colors.red.shade100,
            color: Colors.red,
          ),
        ],
      ),
    ),
  );
}

class RotatingIcon extends StatefulWidget {
  const RotatingIcon({super.key});

  @override
  State<RotatingIcon> createState() => _RotatingIconState();
}

class _RotatingIconState extends State<RotatingIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Icon(CupertinoIcons.exclamationmark_circle, color: Colors.white),
    );
  }
}
