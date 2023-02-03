import 'package:decimal/decimal.dart';

import 'package:warren_task_one/portfolio/model/coin_view_data.dart';

class MovementModel {
  CoinViewData coinEntry;
  CoinViewData coinOut;
  Decimal movementEntry;
  Decimal movementOut;
  String movementDate;
  String dolarValue;

  MovementModel({
    required this.coinEntry,
    required this.coinOut,
    required this.movementEntry,
    required this.movementOut,
    required this.movementDate,
    required this.dolarValue,
  });
}
