import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_task_one/shared/api/coin_prices_endpoint.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warren_task_one/shared/repository/coin_repository.dart';

import '../shared/api_factory.dart';

class CoinEndpointMock extends Mock implements CoinEndpoint {}

void main() {
  late CoinEndpointMock allCoinsEndPoint;
  late CoinRepository coinRepository;
  setUp(() {
    allCoinsEndPoint = CoinEndpointMock();
    coinRepository = CoinRepository(coinEndpoint: allCoinsEndPoint);
  });
  test(
      'WHEN getAllCoins is requested by CoinRepository THEN getAllCoins from allCoinsEndPoint is called ',
      () async {
    when((() => allCoinsEndPoint.getAllCoins())).thenAnswer((_) async =>
        Response(
            data: [ApiFactory.getAllCoins()],
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    await coinRepository.getAllCoins();
    verify(() => allCoinsEndPoint.getAllCoins()).called(1);
  });
}
