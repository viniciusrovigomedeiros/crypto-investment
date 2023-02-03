import 'package:flutter/material.dart';
import 'package:warren_task_one/portfolio/widgets/coin_list.dart';
import 'package:warren_task_one/portfolio/widgets/wallet_header.dart';

class SuccessLoadingBody extends StatelessWidget {
  const SuccessLoadingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [WalletHeader(), Expanded(child: CoinList())],
    );
  }
}
