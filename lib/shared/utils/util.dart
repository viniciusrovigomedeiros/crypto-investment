import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

import '../../movements/model/movement_model.dart';

class Util {
  static Color getContainerValueColor(bool visible) =>
      visible ? Colors.white : const Color.fromARGB(255, 161, 161, 161);

  static IconData getVisibilityIconData(bool visible) =>
      visible ? Icons.visibility : Icons.visibility_off;

  static String getFormatedPercentage(double percentage, String ticker) {
    return "${percentage.toString()} $ticker";
  }

  static Color getVariationColor(String variation) =>
      variation.trim()[0] == '-' ? Colors.red : Colors.green;

  static String getNinetyDaysAgoToTimestamp() {
    return (DateTime.now()
                .subtract(const Duration(days: 90))
                .millisecondsSinceEpoch /
            1000)
        .round()
        .toString();
  }

  static String getDateTimeNowToTimestamp() {
    return (DateTime.now().millisecondsSinceEpoch / 1000).round().toString();
  }

  static TextInputMask getTextInputFormatter(double percentCoin) {
    String integerSpace = '';
    for (var i = 0; i < percentCoin.truncate().toString().length; i++) {
      integerSpace = integerSpace + 9.toString();
    }
    return TextInputMask(mask: ['$integerSpace.999999999999999999999']);
  }

  static String getFormatedEntryValue(MovementModel movement) {
    return '${movement.movementEntry.toString()} ${movement.coinEntry.symbol}';
  }

  static String getFormatedOutValue(MovementModel movement) {
    return '${movement.movementOut.toString()} ${movement.coinOut.symbol}';
  }
}
