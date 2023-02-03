import 'package:flutter/material.dart';

class CoinImage extends StatelessWidget {
  const CoinImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      flex: 1,
      child: Center(
        child: Container(
          height: size.height * .07,
          decoration:
              BoxDecoration(image: DecorationImage(image: NetworkImage(image))),
        ),
      ),
    );
  }
}
