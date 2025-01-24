import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget? child;
  final BoxDecoration? style;

  const GradientBackground({
    Key? key,
    this.child,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/gradient_bg.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16),
            ...(style?.toMap() ?? {}),
    ),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: child,
    ),
    );
  }
}


// GradientBackground(
// child: Center(
// child: Text(
// 'Hello, Flutter!',
// style: TextStyle(color: Colors.white, fontSize: 20),
// ),
// ),
// );
