import 'package:decimal/decimal.dart';

import '../model/coin_view_data.dart';
import '../model/wallet_view_data.dart';

class WalletRepository {
  List<CoinViewData> allCoins = [];
  WalletRepository({
    required this.allCoins,
  });
  List<WalletViewData> getAllUserCoin() {
    List<WalletViewData> walletCoins = [];

    walletCoins.add(
      WalletViewData(
        coin: allCoins[0],
        userBalance: Decimal.parse('19329.25'),
      ),
    );
    walletCoins.add(WalletViewData(
      coin: allCoins[1],
      userBalance: Decimal.parse('1200.20'),
    ));
    walletCoins.add(WalletViewData(
      coin: allCoins[10],
      userBalance: Decimal.parse('500.22323'),
    ));
    walletCoins.add(WalletViewData(
      coin: allCoins[17],
      userBalance: Decimal.parse('1500.24'),
    ));
    walletCoins.add(WalletViewData(
      coin: allCoins[16],
      userBalance: Decimal.parse('70.20'),
    ));
    walletCoins.add(WalletViewData(
      coin: allCoins[14],
      userBalance: Decimal.parse('50.20'),
    ));

    return walletCoins;
  }
}
