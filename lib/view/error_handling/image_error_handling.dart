import 'package:flutter/material.dart';

class ImageErrorHandling extends StatefulWidget {
  const ImageErrorHandling({super.key});

  @override
  _ImageErrorHandlingState createState() => _ImageErrorHandlingState();
}

class _ImageErrorHandlingState extends State<ImageErrorHandling> {
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: _hasError
              ? AssetImage('assets/images/logo/bowling.png') as ImageProvider
              : NetworkImage('https://example.com/nonexistentimage.jpg'),
          fit: BoxFit.cover,
          onError: (exception, stackTrace) {
            setState(() {
              _hasError = true;
            });
          },
        ),
      ),
      child: Center(child: Text('Content here')),
    );
  }
}
