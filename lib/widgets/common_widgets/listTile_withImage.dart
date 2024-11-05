import 'package:flutter/material.dart';

class ReusableListTileWithImageBelow extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String imagePath;
  final IconData? icon;
  final void Function()? onTap;

  const ReusableListTileWithImageBelow({
    super.key,
    required this.title,
    this.subtitle,
    required this.imagePath,
    this.icon, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      leading: Image.asset(
        imagePath,
        width: 30,
        height: 30,
      ),
      title: Text(title),
      subtitle: subtitle != null
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle!,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 4),
        ],
      )
          : null,
      trailing: icon != null ? Icon(icon) : null,
      onTap:onTap ,
    );
  }
}
