part 'coin_result_image_response.g.dart';

class CoinResultImageResponse {
  final String thumb;
  final String small;
  final String large;
  CoinResultImageResponse(
    this.thumb,
    this.small,
    this.large,
  );
  factory CoinResultImageResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinResultImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoinResultImageResponseToJson(this);
}
