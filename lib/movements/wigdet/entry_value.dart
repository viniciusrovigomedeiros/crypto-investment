import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EntryValue extends StatelessWidget {
  const EntryValue({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AutoSizeText(
      maxLines: 1,
      value,
      style: TextStyle(
        fontFamily: "Mansny-light",
        fontWeight: FontWeight.bold,
        fontSize: size.height * .022,
      ),
    );
  }
}
