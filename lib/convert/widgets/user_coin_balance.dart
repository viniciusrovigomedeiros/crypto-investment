import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/portfolio/model/coin_view_data.dart';

import '../../portfolio/provider/wallet_provider.dart';
import '../../shared/utils/util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserCoinBalance extends HookConsumerWidget {
  const UserCoinBalance({
    super.key,
    required this.coin,
  });

  final CoinViewData coin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletController = ref.watch(walletControllerProvider);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
      ),
      color: const Color.fromARGB(255, 236, 238, 245),
      height: size.height * .08,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.userCryptoBalance,
            style: TextStyle(
                fontFamily: "Mansny regular",
                fontSize: size.height * .02,
                color: const Color.fromARGB(255, 95, 95, 95)),
          ),
          AutoSizeText(
            style: TextStyle(
                fontFamily: "Mansny-light",
                fontSize: size.height * .017,
                fontWeight: FontWeight.bold),
            Util.getFormatedPercentage(
                walletController.selectedWalletCoin.percent, coin.symbol),
            maxFontSize: 25,
            maxLines: 1,
            minFontSize: 1,
          ),
        ],
      ),
    );
  }
}
