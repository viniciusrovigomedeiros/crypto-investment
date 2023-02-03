import 'package:decimal/decimal.dart';

import 'coin_view_data.dart';

class WalletViewData {
  Decimal userBalance;
  late double percent;
  CoinViewData coin;

  WalletViewData({
    required this.userBalance,
    required this.coin,
  }) {
    percent = getPercentageCoin();
  }

  double getPercentageCoin() {
    return (userBalance.toDouble() * 100) /
        coin.market_data!.current_price.usd /
        100;
  }
}
