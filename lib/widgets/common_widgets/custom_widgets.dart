
import 'package:idly_factory/core/export.dart';

class EvSmallButton extends StatelessWidget {
  final String text;
  final double? size;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;

  const EvSmallButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.size, this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: size?.h ?? 6.h, horizontal: size?.w ?? 12.w),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyle.buttonsAction,
      ),
    );
  }
}
