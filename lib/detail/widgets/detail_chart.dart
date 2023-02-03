import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/wallet_view_data.dart';
import 'coin_chart.dart';
import 'period_button.dart';

class DetailChart extends HookConsumerWidget {
  final WalletViewData wallet;
  const DetailChart({
    Key? key,
    required this.wallet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      child: Column(
        children: [
          const CoinChart(),
          Row(
            children: const [
              PeriodButton(period: 5),
              PeriodButton(
                period: 15,
              ),
              PeriodButton(period: 30),
              PeriodButton(period: 40),
              PeriodButton(
                period: 90,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
