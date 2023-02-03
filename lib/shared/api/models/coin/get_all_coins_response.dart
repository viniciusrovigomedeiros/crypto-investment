import 'coin_result_response.dart';

part 'get_all_coins_response.g.dart';

class GetAllCoinsResponse {
  final List<CoinResultResponse> result;

  GetAllCoinsResponse(
    this.result,
  );

  factory GetAllCoinsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCoinsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCoinsResponseToJson(this);
}
