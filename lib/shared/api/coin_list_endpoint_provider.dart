import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'coin_prices_endpoint.dart';

final coinEndpointProvider = Provider(((ref) {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.coingecko.com/api/v3'));
  return CoinEndpoint(dio);
}));
////