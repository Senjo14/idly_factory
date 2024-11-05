import 'package:flutter/material.dart';

class FadeAnimationWidget extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const FadeAnimationWidget({
    Key? key,
    required this.animation,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
