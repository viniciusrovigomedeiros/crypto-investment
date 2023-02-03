import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/coin_list_endpoint_provider.dart';
import 'coin_prices_repository.dart';

final coinPricesRepositoryProvider = Provider((ref) {
  return CoinPricesRepository(coinEndpoint: ref.read(coinEndpointProvider));
});
