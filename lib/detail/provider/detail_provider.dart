import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../../shared/repository/coin_prices_repository_provider.dart';
import '../controller/detail_controller.dart';
import '../usecase/get_coin_prices_use_case.dart';

final detailControllerProvider = ChangeNotifierProvider(
  (ref) => DetailsController(),
);

final pageIndexProvider = StateProvider<int>(
  (ref) => 0,
);

final getPriceHistory = StateProvider((ref) {
  return GetCoinPricesUseCase(
      repository: ref.read(coinPricesRepositoryProvider));
});

final coinHistoryPricesProvider =
    FutureProvider<List<CoinValueResponse>?>((ref) async {
  return ref.read(getPriceHistory).execute(ref.read(detailControllerProvider));
});
