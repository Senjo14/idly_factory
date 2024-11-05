import 'package:idly_factory/core/export.dart';

class TextButtons extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final TextStyle? textStyle;

  const TextButtons({
    super.key,
    required this.text,
    this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ?? TextStyle(
          fontSize: 20.sp,
          color: Colors.red,
        ),
      ),
    );
  }
}
