import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../portfolio/model/wallet_view_data.dart';
import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../../shared/utils/util.dart';
import 'convert_button.dart';
import 'currency_variation_value.dart';
import 'detail_coin_value.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailDescription extends HookConsumerWidget {
  final WalletViewData wallet;
  final List<CoinValueResponse> data;
  const DetailDescription({
    super.key,
    required this.wallet,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DetailCoinValue(
          description: AppLocalizations.of(context)!.currentPrice,
          value: NumberFormat.simpleCurrency(name: 'US\$ ', decimalDigits: 2)
              .format(DecimalIntl(Decimal.parse(
                  (wallet.coin.market_data!.current_price.usd).toString()))),
        ),
        CurrencyVariationValue(
          description: AppLocalizations.of(context)!.priceVariation,
          value:
              '${(wallet.coin.market_data!.price_change_percentage_24h.toStringAsFixed(2)).toString()}%',
        ),
        DetailCoinValue(
          description: AppLocalizations.of(context)!.userCryptoBalance,
          value: Util.getFormatedPercentage(wallet.percent, wallet.coin.symbol),
        ),
        DetailCoinValue(
          description: AppLocalizations.of(context)!.userCryptoValue,
          value: NumberFormat.simpleCurrency(name: 'US\$ ', decimalDigits: 2)
              .format(DecimalIntl(
                  Decimal.parse((wallet.userBalance.toDouble()).toString()))),
        ),
        ConvertButton(
          data: data,
          coin: wallet.coin,
        ),
      ],
    );
  }
}
