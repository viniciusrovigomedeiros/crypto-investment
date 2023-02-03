import 'package:dio/dio.dart';

class CoinEndpoint {
  final Dio dio;
  CoinEndpoint(
    this.dio,
  );
  Future<Response> getCoinHistoryPrices(
      String coinId, String initialDate, String finalDate) {
    return dio.get("/coins/$coinId/market_chart/range", queryParameters: {
      "vs_currency": "usd",
      "from": initialDate,
      "to": finalDate,
    });
  }

  Future<Response> getAllCoins() {
    return dio.get("/coins");
  }
}
