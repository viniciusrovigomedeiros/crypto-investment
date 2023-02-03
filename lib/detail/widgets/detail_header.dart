import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../portfolio/model/wallet_view_data.dart';
import 'coin_price.dart';
import 'coin_ticker.dart';
import 'coin_title_detail.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    Key? key,
    required this.wallet,
  }) : super(key: key);

  final WalletViewData wallet;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 27, horizontal: size.width * .05),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoinTitleDetail(
              coinIcon: wallet.coin.image!.small,
              coinName: wallet.coin.name,
            ),
            CoinTicker(coinTicker: wallet.coin.symbol),
            CoinPrice(
              coinPrice: Decimal.parse(
                  wallet.coin.market_data!.current_price.usd.toString()),
            ),
          ]),
    );
  }
}
