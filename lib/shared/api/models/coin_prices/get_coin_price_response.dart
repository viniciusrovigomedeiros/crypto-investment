import 'coin_price_response.dart';

part 'get_coin_price_response.g.dart';

class GetCoinPriceResponse {
  final List<CoinValueResponse> price;

  GetCoinPriceResponse({
    required this.price,
  });

  factory GetCoinPriceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCoinPriceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCoinPriceResponseToJson(this);
}
