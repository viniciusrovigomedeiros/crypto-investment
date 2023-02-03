import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextPageHeader extends StatelessWidget {
  final String title;
  final double fontSize;
  const TextPageHeader({
    Key? key,
    required this.title,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: TextStyle(
        fontFamily: "Mansny-regular",
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}
