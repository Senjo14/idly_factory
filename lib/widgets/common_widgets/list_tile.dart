import 'package:flutter/material.dart';

class ReusableListTileWithImage extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? imagePath;
  final IconData? icon;
  final void Function()? onTap;

  const ReusableListTileWithImage({
    Key? key,
    required this.title,
    this.subtitle,
    this.imagePath,
    this.icon, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          if (imagePath != null)
            Image.asset(
              imagePath!,
              width: 40,
              height: 40,
            ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: TextStyle(color: Colors.grey),
                ),
            ],
          ),
        ],
      ),
      trailing: icon != null ? Icon(icon) : null,
      onTap: onTap,
    );
  }
}
