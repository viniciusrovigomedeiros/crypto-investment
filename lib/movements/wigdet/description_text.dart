import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String text;
  const DescriptionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text,
        style: const TextStyle(fontWeight: FontWeight.bold));
  }
}
