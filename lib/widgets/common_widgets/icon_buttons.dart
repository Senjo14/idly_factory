
import 'package:idly_factory/core/export.dart';

class IconButtons extends StatelessWidget {
  final IconData icon;
  final double? iconSize;
  final Color? color;
  final void Function() onPressed;
  final String? tooltip;

  const IconButtons({
    super.key,
    required this.icon,
    this.iconSize,
    this.color,
    required this.onPressed,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: iconSize, color: color),
      tooltip: tooltip,
    );
  }
}
