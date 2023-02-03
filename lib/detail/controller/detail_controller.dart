import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../portfolio/model/coin_view_data.dart';
import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../../shared/utils/util.dart';

class DetailsController extends ChangeNotifier {
  late CoinViewData? coin;

  late String? initialDate;

  late String? finalDate;

  int period = 5;

  int _getPeriodIntervalPoint() {
    return period * 24;
  }

  double getIntervalMaxPoint() {
    return _pricesList.length.toDouble();
  }

  double getMinX() {
    return (getIntervalMaxPoint() - _getPeriodIntervalPoint().toDouble());
  }

  late List<CoinValueResponse> _pricesList;

  DetailsController() {
    initialDate = Util.getNinetyDaysAgoToTimestamp();
    finalDate = Util.getDateTimeNowToTimestamp();
  }

  void setCoinHistoryPriceValues(List<CoinValueResponse> prices) {
    _pricesList = prices;
  }

  List<CoinValueResponse> getRangeValues() {
    if (_pricesList.length <= 90) {
      return _pricesList.sublist(getIntervalMaxPoint().toInt() - period);
    } else {
      return _pricesList.sublist(
          (getIntervalMaxPoint().toInt()) - _getPeriodIntervalPoint(),
          getIntervalMaxPoint().toInt());
    }
  }

  List<FlSpot> getCoinHistoryChartSpots() {
    List<FlSpot> chartSpots = [];
    List<CoinValueResponse> rangeValues = getRangeValues();
    int j = _pricesList.length;

    for (var i = rangeValues.length - 1;
        i != rangeValues.length - (_getPeriodIntervalPoint());
        i--) {
      chartSpots.add(FlSpot(j.toDouble(), rangeValues[i].values[1]));
      j--;
    }

    return chartSpots;
  }

  void setPeriod(int period) {
    this.period = period;

    notifyListeners();
  }
}
