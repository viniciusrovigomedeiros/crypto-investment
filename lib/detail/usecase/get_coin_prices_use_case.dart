import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../../shared/repository/coin_prices_repository.dart';
import '../controller/detail_controller.dart';
import '../mapper/coin_price_mapper.dart';

class GetCoinPricesUseCase {
  final CoinPricesRepository repository;
  GetCoinPricesUseCase({
    required this.repository,
  });
  Future<List<CoinValueResponse>?> execute(
      DetailsController coinDetails) async {
    if (coinDetails.coin != null &&
        coinDetails.initialDate != null &&
        coinDetails.finalDate != null) {
      final response = await repository.getCoinHistoryPrices(
          coinDetails.coin!.id,
          coinDetails.initialDate!,
          coinDetails.finalDate!);
      return response.toViewData();
    }
    return null;
  }
}
