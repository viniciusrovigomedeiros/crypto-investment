import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ValuesText extends StatelessWidget {
  const ValuesText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: const TextStyle(color: Color.fromARGB(255, 117, 118, 128)),
    );
  }
}
