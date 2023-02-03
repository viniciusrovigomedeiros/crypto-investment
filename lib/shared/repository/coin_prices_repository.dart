import '../api/coin_prices_endpoint.dart';

import '../api/models/coin_prices/get_coin_price_response.dart';

class CoinPricesRepository {
  final CoinEndpoint coinEndpoint;
  CoinPricesRepository({
    required this.coinEndpoint,
  });

  Future<GetCoinPriceResponse> getCoinHistoryPrices(
      String coinId, String initialDate, String finalDate) async {
    final result =
        await coinEndpoint.getCoinHistoryPrices(coinId, initialDate, finalDate);
    return GetCoinPriceResponse.fromJson(result.data);
  }
}
