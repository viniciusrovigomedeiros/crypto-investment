import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warren_task_one/shared/api/coin_prices_endpoint.dart';

import '../shared/api_factory.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Response<Map<String, dynamic>> sucess;
  late DioMock dioMock;
  late CoinEndpoint allCoinsEndPoint;

  When mockGetResponse() => when(
      () => dioMock.get(any(), queryParameters: any(named: 'queryParameters')));

  mockResponse(Map<String, dynamic> factory, int statusCode) => Response(
      data: factory,
      statusCode: statusCode,
      requestOptions: RequestOptions(path: faker.internet.httpUrl()));

  setUp(() {
    dioMock = DioMock();
    allCoinsEndPoint = CoinEndpoint(dioMock);
  });

  setUp(() {
    sucess = mockResponse(ApiFactory.getAllCoins(), 200);
  });
  test('WHEN getAllCoins is requested THEN returns 200', (() async {
    mockGetResponse().thenAnswer((_) async => sucess);
    final result = await allCoinsEndPoint.getAllCoins();
    expect(result.statusCode, equals(200));
  }));
}
