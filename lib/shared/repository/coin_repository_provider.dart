import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/coin_list_endpoint_provider.dart';
import 'coin_repository.dart';

final coinRepositoryProvider = Provider((ref) {
  return CoinRepository(coinEndpoint: ref.read(coinEndpointProvider));
});
