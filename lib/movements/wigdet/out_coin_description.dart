import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warren_task_one/movements/wigdet/description_text.dart';
import 'package:warren_task_one/movements/wigdet/values_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../model/movement_model.dart';

class OutCoinDescription extends StatelessWidget {
  const OutCoinDescription({
    super.key,
    required this.movement,
  });

  final MovementModel movement;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 227, 228, 235),
            width: 2,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              size: size.height * 0.060,
              Icons.arrow_drop_up_sharp,
              color: Colors.green,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.10,
                    height: size.height * .07,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage(movement.coinEntry.image!.small))),
                  ),
                  AutoSizeText(
                    movement.coinEntry.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * .017),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DescriptionText(
                          text: AppLocalizations.of(context)!.priceVariation),
                      DescriptionText(
                          text: AppLocalizations.of(context)!.userCryptoValue),
                      DescriptionText(
                          text: AppLocalizations.of(context)!.movementAmount),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ValuesText(
                        text: movement
                            .coinEntry.market_data!.price_change_percentage_24h
                            .toStringAsFixed(5),
                      ),
                      ValuesText(
                          text: NumberFormat.simpleCurrency(
                                  name: 'US\$ ', decimalDigits: 2)
                              .format(movement
                                  .coinEntry.market_data!.current_price.usd)),
                      ValuesText(
                          text:
                              '${movement.movementEntry.toStringAsFixed(3)} ${movement.coinEntry.symbol}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
