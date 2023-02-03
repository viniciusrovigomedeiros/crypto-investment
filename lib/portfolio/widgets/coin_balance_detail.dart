import 'package:flutter/material.dart';

import '../model/wallet_view_data.dart';
import 'coin_balance.dart';
import 'coin_percentage.dart';

class CoinBalanceDetail extends StatelessWidget {
  const CoinBalanceDetail({
    Key? key,
    required this.wallet,
  }) : super(key: key);

  final WalletViewData wallet;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(wallet.coin.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Mansny-Book",
                  )),
              CoinBalance(wallet: wallet),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                wallet.coin.symbol,
                style: const TextStyle(
                    fontFamily: "Mansny-Book",
                    fontSize: 15,
                    color: Color.fromARGB(255, 117, 118, 128)),
              ),
              CoinPercentage(coin: wallet),
            ],
          ),
        ],
      ),
    );
  }
}
