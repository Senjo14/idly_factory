import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double radius;
  final String imagePath;

  const LogoWidget({
    Key? key,
    required this.radius,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(imagePath),
    );
  }
}
