import 'package:flutter/material.dart';

class CoinTicker extends StatelessWidget {
  const CoinTicker({
    Key? key,
    required this.coinTicker,
  }) : super(key: key);

  final String coinTicker;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text(coinTicker,
        style: TextStyle(
          fontFamily: "Mansny-regular",
          fontWeight: FontWeight.normal,
          fontSize: size.height * .02,
        ));
  }
}
