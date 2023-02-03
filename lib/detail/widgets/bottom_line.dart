import 'package:flutter/material.dart';

class BottomLine extends StatelessWidget {
  const BottomLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      height: size.height * 0.009,
      width: size.width * .36,
    );
  }
}
