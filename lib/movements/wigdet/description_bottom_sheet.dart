import 'package:flutter/material.dart';
import 'package:warren_task_one/movements/model/movement_model.dart';
import 'package:warren_task_one/movements/wigdet/description_text.dart';
import 'package:warren_task_one/movements/wigdet/out_coin_description.dart';
import 'package:warren_task_one/movements/wigdet/values_text.dart';

import 'entry_coint_description.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DescriptionBottomSheet extends StatelessWidget {
  const DescriptionBottomSheet({
    super.key,
    required this.movement,
  });

  final MovementModel movement;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height <= 650 ? size.height * 0.500 : size.height * 0.33,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 75, 75, 75),
              blurRadius: 15,
            )
          ],
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17), topRight: Radius.circular(17))),
      child: Column(
        children: [
          EntryCoinDescription(movement: movement),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color.fromARGB(255, 227, 228, 235),
                  width: 2,
                ),
              ),
            ),
            height: size.height * .06,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DescriptionText(
                      text: AppLocalizations.of(context)!.movementsAppBar,
                    ),
                    ValuesText(text: movement.dolarValue.toString()),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DescriptionText(
                      text: AppLocalizations.of(context)!.movementDate,
                    ),
                    ValuesText(text: movement.movementDate.toString()),
                  ],
                ),
              ],
            ),
          ),
          OutCoinDescription(movement: movement),
        ],
      ),
    );
  }
}
