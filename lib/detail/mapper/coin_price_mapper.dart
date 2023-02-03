import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../../shared/api/models/coin_prices/get_coin_price_response.dart';

extension CoinMapper on GetCoinPriceResponse {
  List<CoinValueResponse> toViewData() {
    return price;
  }
}
