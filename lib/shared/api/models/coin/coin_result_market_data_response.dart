import 'coin_result_market_data_current_price.dart';

part 'coin_result_market_data_response.g.dart';

class CoinResultMarketDataResponse {
  final CoinResultMarketDataCurrentPrice current_price;
  final double price_change_percentage_24h;

  CoinResultMarketDataResponse(
    this.current_price,
    this.price_change_percentage_24h,
  );

  factory CoinResultMarketDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinResultMarketDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoinResultMarketDataResponseToJson(this);
}
