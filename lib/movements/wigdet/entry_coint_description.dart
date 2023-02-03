import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warren_task_one/movements/wigdet/description_text.dart';
import 'package:warren_task_one/movements/wigdet/values_text.dart';

import '../model/movement_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EntryCoinDescription extends StatelessWidget {
  const EntryCoinDescription({
    super.key,
    required this.movement,
  });

  final MovementModel movement;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17), topRight: Radius.circular(17))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              size: size.height * 0.060,
              Icons.arrow_drop_down_sharp,
              color: Colors.red,
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
                                NetworkImage(movement.coinOut.image!.small))),
                  ),
                  AutoSizeText(
                    movement.coinOut.name,
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            .coinOut.market_data!.price_change_percentage_24h
                            .toString(),
                      ),
                      ValuesText(
                          text: NumberFormat.simpleCurrency(
                                  name: 'US\$ ', decimalDigits: 2)
                              .format(movement
                                  .coinOut.market_data!.current_price.usd)),
                      ValuesText(
                          text:
                              '${movement.movementOut.toString()} ${movement.coinOut.symbol}'),
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
