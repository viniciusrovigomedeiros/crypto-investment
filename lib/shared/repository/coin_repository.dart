import '../api/coin_prices_endpoint.dart';

import '../api/models/coin/get_all_coins_response.dart';

class CoinRepository {
  final CoinEndpoint coinEndpoint;

  CoinRepository({required this.coinEndpoint});

  Future<GetAllCoinsResponse> getAllCoins() async {
    final result = await coinEndpoint.getAllCoins();
    return GetAllCoinsResponse.fromJson({"result": result.data});
  }
}
