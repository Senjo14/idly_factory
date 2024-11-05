import 'package:flutter/material.dart';

class TimBot extends StatefulWidget {
  const TimBot({super.key});

  @override
  State<TimBot> createState() => _TimBotState();
}

class _TimBotState extends State<TimBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.green,
          strokeWidth: 1.5,
        ),
      ),
    );
  }
}
