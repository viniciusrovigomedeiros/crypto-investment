import 'package:auto_size_text/auto_size_text.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinPrice extends StatelessWidget {
  const CoinPrice({
    Key? key,
    required this.coinPrice,
  }) : super(key: key);

  final Decimal coinPrice;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 09),
      child: AutoSizeText(
          maxLines: 1,
          NumberFormat.simpleCurrency(name: 'US\$ ', decimalDigits: 2)
              .format(DecimalIntl(Decimal.parse(coinPrice.toString()))),
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Montserrat",
            fontSize: size.height * .040,
          )),
    );
  }
}
