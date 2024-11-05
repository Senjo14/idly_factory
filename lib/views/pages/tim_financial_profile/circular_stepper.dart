import 'package:flutter/material.dart';
import 'dart:math';

class CircularStepperPainter extends CustomPainter {
  final double percentage; // Percentage to display

  CircularStepperPainter({
    required this.percentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = size.width / 2;

    // First step (20% Red, then Green)
    if (percentage >= 0.2) {
      paint.color = Colors.red;
      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
        -pi / 2,
        2 * pi * 0.2,
        false,
        paint,
      );
    }

    if (percentage >= 0.4) {
      paint.color = Colors.green;
      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
        -pi / 2 + 2 * pi * 0.2, // Start after the red segment
        2 * pi * 0.2, // Next 20% for step 2 (Green)
        false,
        paint,
      );
    }

    if (percentage >= 0.6) {
      paint.color = Colors.yellow;
      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
        -pi / 2 + 2 * pi * 0.4, // Start after red + green
        2 * pi * 0.2, // Next 20% for step 3 (Yellow)
        false,
        paint,
      );
    }

    if (percentage >= 0.8) {
      paint.color = Colors.blue;
      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
        -pi / 2 + 2 * pi * 0.6, // Start after red + green + yellow
        2 * pi * 0.2, // Next 20% for step 4 (Blue)
        false,
        paint,
      );
    }

    if (percentage == 1.0) {
      paint.color = Colors.green;
      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
        -pi / 2 + 2 * pi * 0.8, // Start after red + green + yellow + blue
        2 * pi * 0.2, // Final 20% (Green) to complete the circle
        false,
        paint,
      );
    }

    // Remaining steps (Grey for the rest)
    paint.color = Colors.grey;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
      -pi / 2 + 2 * pi * percentage, // Start after the filled portion
      2 * pi * (1 - percentage), // Remaining arc is grey
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint whenever changes are made
  }
}
