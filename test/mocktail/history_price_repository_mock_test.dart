import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warren_task_one/shared/repository/coin_prices_repository.dart';

import '../shared/api_factory.dart';
import 'all_coins_repository_mock_test.dart';

void main() {
  late CoinEndpointMock historyPriceCoinEndPoint;
  late CoinPricesRepository coinRepository;
  setUp(() {
    historyPriceCoinEndPoint = CoinEndpointMock();
    coinRepository =
        CoinPricesRepository(coinEndpoint: historyPriceCoinEndPoint);
  });
  test(
      'WHEN getCoinHistoryPrices is requested by CoinPricesRepository THEN getCoinHistoryPrices from historyPriceCoinEndPoint is called ',
      () async {
    when((() => historyPriceCoinEndPoint.getCoinHistoryPrices(
            'bitcoin', '1659751423', '1665021823')))
        .thenAnswer((_) async => Response(
            data: ApiFactory.getCoinHistoryPrices(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    await coinRepository.getCoinHistoryPrices(
        'bitcoin', '1659751423', '1665021823');
    verify(() => historyPriceCoinEndPoint.getCoinHistoryPrices(
        'bitcoin', '1659751423', '1665021823')).called(1);
  });
}
