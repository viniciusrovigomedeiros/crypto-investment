import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/wallet_provider.dart';
import 'coin_item.dart';

class CoinList extends HookConsumerWidget {
  const CoinList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletController = ref.watch(walletControllerProvider);
    return RefreshIndicator(
      displacement: 25,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      backgroundColor: const Color.fromARGB(255, 244, 43, 87),
      color: Colors.white,
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 1));
      },
      child: ListView.builder(
        itemCount: walletController.coins.length,
        itemBuilder: (context, index) {
          return CoinItem(
            wallet: walletController.coins[index],
          );
        },
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
