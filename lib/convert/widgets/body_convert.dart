import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/shared/widget/text_page_header.dart';
import 'package:warren_task_one/convert/widgets/total_convert.dart';
import 'package:warren_task_one/portfolio/model/coin_view_data.dart';

import '../../portfolio/provider/wallet_provider.dart';
import '../../shared/utils/util.dart';
import '../provider/convert_provider.dart';
import 'convert_coin_container.dart';
import 'current_coin_container.dart';
import 'user_coin_balance.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BodyConvert extends StatefulHookConsumerWidget {
  const BodyConvert({
    this.coin,
    super.key,
  });

  @override
  BodyConvertState createState() => BodyConvertState();
  final CoinViewData? coin;
}

class BodyConvertState extends ConsumerState<BodyConvert>
    with SingleTickerProviderStateMixin {
  TextEditingController convertValueController = TextEditingController();
  CoinViewData? coin;
  @override
  Widget build(BuildContext context) {
    coin = widget.coin ??
        ModalRoute.of(context)!.settings.arguments as CoinViewData;
    // CoinViewData coin =
    //     ModalRoute.of(context)!.settings.arguments as CoinViewData;

    final convertController = ref.watch(convertControllerProvider);

    final walletController = ref.watch(walletControllerProvider);
    convertController.refresh(coin!, walletController.selectedWalletCoin);

    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        UserCoinBalance(coin: coin!),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.035),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextPageHeader(
                fontSize: size.height * .037,
                title: AppLocalizations.of(context)!.convertTitle,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * .03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CurrentCoinContainer(coin: coin!),
                    const Icon(
                      Icons.cached,
                      color: Color.fromARGB(255, 244, 43, 87),
                    ),
                    const ConvertCoinContainer(),
                  ],
                ),
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    Util.getTextInputFormatter(
                        walletController.selectedWalletCoin.percent)
                  ],
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                  onChanged: (value) {
                    convertController.setConvertValue(value);
                  },
                  controller: convertValueController,
                  decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      prefixIconConstraints: BoxConstraints.loose(size),
                      prefixIcon: Text(
                        '${coin!.symbol} ',
                        style: TextStyle(
                            fontSize: size.height * .04,
                            color: convertValueController.text.isNotEmpty
                                ? Colors.black
                                : const Color.fromARGB(255, 150, 150, 150)),
                      ),
                      hintStyle: TextStyle(
                          fontSize: size.height * .04,
                          color: const Color.fromARGB(255, 150, 150, 150)),
                      hintText: '0,00',
                      helperText: convertController.isValidConversion
                          ? convertController.getDolarFormatedValue()
                          : convertController.helperMessage,
                      helperStyle: TextStyle(
                          fontSize: 15,
                          color: convertController.isValidConversion
                              ? Colors.grey
                              : const Color.fromARGB(255, 244, 43, 87)))),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TotalConvert(),
            ],
          ),
        ),
      ],
    );
  }
}
