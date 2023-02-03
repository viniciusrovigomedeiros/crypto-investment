import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/portfolio/widgets/success_loading_body.dart';

import '../../convert/provider/convert_provider.dart';
import '../provider/wallet_provider.dart';
import '../repository/wallet_repository.dart';
import 'loading_wallet.dart';

class BodyPortfolio extends HookConsumerWidget {
  const BodyPortfolio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getAllCoinsProvider = ref.watch(getAllCoinsFutureProvider);
    final walletController = ref.watch(walletControllerProvider);
    final allCoinsController = ref.watch(allCoinsControllerProvider);
    return SafeArea(
        child: getAllCoinsProvider.when(
            data: (data) {
              walletController.coins =
                  WalletRepository(allCoins: data).getAllUserCoin();

              allCoinsController.coins = data;
              return const SuccessLoadingBody();
            },
            error: (error, stackTrace) => const AutoSizeText(
                  maxLines: 1,
                  'Ops, algo aconteceu! Tente novamente mais tarde ',
                  style: TextStyle(
                    fontFamily: "Mansny regular",
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
            loading: () => const LoadingWallet()));
  }
}
