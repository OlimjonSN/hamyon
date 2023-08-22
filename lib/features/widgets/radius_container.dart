import 'package:flutter/material.dart';

class RadiusContainer extends StatelessWidget {
  final Color? color;
  final Widget child;
  const RadiusContainer({
    required this.child,
    this.color = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: child,
    );
  }
}
