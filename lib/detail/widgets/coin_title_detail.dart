import 'package:flutter/material.dart';

class CoinTitleDetail extends StatelessWidget {
  const CoinTitleDetail({
    Key? key,
    required this.coinName,
    required this.coinIcon,
  }) : super(key: key);

  final String coinName;
  final String coinIcon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(coinName,
            style: TextStyle(
              fontFamily: "Mansny regular",
              fontWeight: FontWeight.bold,
              fontSize: size.height * .040,
            )),
        Container(
          width: size.height * .06,
          height: size.height * .06,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(coinIcon))),
        ),
      ],
    );
  }
}
