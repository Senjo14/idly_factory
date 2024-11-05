import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatelessWidget {
  final String qrData;
  QrCode({super.key, required this.qrData});


  @override
  Widget build(BuildContext context) {
    return Center(
      child:  QrImageView(
          data: qrData,
          version: QrVersions.auto,
          size: 250.w,
        ),
    );
  }
}
