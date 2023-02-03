import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/wallet_view_data.dart';
import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../provider/detail_provider.dart';
import 'detail_chart.dart';
import 'detail_description.dart';
import 'detail_header.dart';
import 'loading_details.dart';

class BodyDetail extends StatefulHookConsumerWidget {
  const BodyDetail({
    Key? key,
    required this.wallet,
  }) : super(key: key);

  final WalletViewData wallet;
  @override
  BodyDetailState createState() => BodyDetailState();
}

class BodyDetailState extends ConsumerState<BodyDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final coinHistoryPriceProvider = ref.read(coinHistoryPricesProvider);
    final detailController = ref.watch(detailControllerProvider);
    return SafeArea(
        child: coinHistoryPriceProvider.when(data: (data) {
      detailController
          .setCoinHistoryPriceValues(data as List<CoinValueResponse>);
      return SingleChildScrollView(
        controller: ScrollController(initialScrollOffset: 15),
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: size.height - size.height * 0.07,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailsHeader(wallet: widget.wallet),
              DetailChart(wallet: widget.wallet),
              Expanded(
                  child: DetailDescription(data: data, wallet: widget.wallet))
            ],
          ),
        ),
      );
    }, error: (error, stackTrace) {
      return Center(
        child: AutoSizeText(
          maxLines: 1,
          'Ops, algo aconteceu! Tente novamente mais tarde ',
          style: TextStyle(
            fontFamily: "Mansny regular",
            fontWeight: FontWeight.bold,
            fontSize: size.height * .040,
          ),
        ),
      );
    }, loading: () {
      Timer(const Duration(seconds: 1), () {
        setState(() {});
      });
      return const LoadingDetails();
    }));
  }
}
