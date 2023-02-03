import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../model/wallet_view_data.dart';

class WalletController extends ChangeNotifier {
  late List<WalletViewData> coins = [];
  late WalletViewData selectedWalletCoin;

  Decimal getTotalBalance() {
    Decimal total = Decimal.fromInt(0);
    for (WalletViewData coin in coins) {
      total += coin.userBalance;
    }
    return total;
  }
}
