import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DolarValue extends StatelessWidget {
  final String value;
  const DolarValue({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AutoSizeText(
        maxLines: 1,
        value,
        style: TextStyle(
          fontFamily: "Mansny-regular",
          color: Colors.black,
          fontSize: size.height * .019,
        ));
  }
}
