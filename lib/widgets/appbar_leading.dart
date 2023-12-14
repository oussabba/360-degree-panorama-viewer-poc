import 'package:flutter/material.dart';

class AppBarLeading extends StatelessWidget {
  final String? iconPath;
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color color;
  final Color? backgroundColor;
  final Color borderColor;
  const AppBarLeading({
    super.key,
    required this.onTap,
    this.iconPath,
    this.height = 35,
    this.width = 35,
    this.color = Colors.black,
    this.backgroundColor,
    this.borderColor = const Color(0XffD1D1D1),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: PreferredSize(
        preferredSize: Size.fromHeight(height),
        child: Container(
          height: height,
          width: width,
          margin: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
          ),
          child: Center(
            child: iconPath != null
                ? Image.asset(
                    color: color,
                    iconPath!,
                    height: 25,
                    width: 25,
                  )
                : Icon(
                    Icons.arrow_back,
                    color: color,
                  ),
          ),
        ),
      ),
    );
  }
}
