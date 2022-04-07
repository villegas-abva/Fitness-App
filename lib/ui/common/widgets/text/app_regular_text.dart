import 'package:flutter/material.dart';

class AppRegularText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final bool isBold;
  final bool isCentered;
  final bool hasOverflow;
  final int maxLines;

  const AppRegularText(
      {Key? key,
      required this.text,
      this.color = Colors.black54,
      this.size = 16,
      this.isBold = false,
      this.isCentered = false,
      this.hasOverflow = false,
      this.maxLines = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: TextAlign.center,
      // textAlign: isCentered ? TextAlign.center : TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: 'RedHat',
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
