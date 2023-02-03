import '../../shared/api/models/coin/coin_result_image_response.dart';
import '../../shared/api/models/coin/coin_result_market_data_response.dart';

class CoinViewData {
  final String id;
  final String symbol;
  final String name;
  final CoinResultImageResponse? image;
  final CoinResultMarketDataResponse? market_data;

  CoinViewData({
    required this.id,
    required this.symbol,
    required this.name,
    this.image,
    this.market_data,
  });
}
