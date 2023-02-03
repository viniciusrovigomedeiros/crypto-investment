import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:warren_task_one/detail/mapper/coin_price_mapper.dart';
import 'package:warren_task_one/movements/controller/movement_controler.dart';
import 'package:warren_task_one/movements/repository/movement_repository.dart';
import 'package:warren_task_one/portfolio/repository/wallet_repository.dart';
import 'package:warren_task_one/shared/api/models/coin/coin_result_response.dart';
import 'package:warren_task_one/shared/api/models/coin/get_all_coins_response.dart';
import 'package:warren_task_one/shared/api/models/coin_prices/get_coin_price_response.dart';
import 'package:warren_task_one/shared/repository/coin_prices_repository.dart';

import '../helpers/mock_data.dart';

void main() {
  MockData mockData = MockData();

  test(
    'WHEN WalletRepository initialize THEN getAllUserCoin length',
    () {
      WalletRepository walletRepo =
          WalletRepository(allCoins: mockData.getCoinViewDataList());
      expect(walletRepo.getAllUserCoin().length, 6);
    },
  );
  test(
    'WHEN GetAllCoinsResponse initialize THEN getAllCoinsResponse.toJson()[result] length ',
    () {
      GetAllCoinsResponse getAllCoinsResponse =
          GetAllCoinsResponse(mockData.getCoinResultResponseList());

      expect(
          (getAllCoinsResponse.toJson()['result'] as List<CoinResultResponse>)
              .length,
          mockData.getCoinResultResponseList().length);
    },
  );
  test(
    'WHEN MovementControler initialize with one movement THEN movementRepo allMovement with one item ',
    () {
      MovementControler movementControler =
          MovementControler(MovementRepository());
      movementControler.addMovement(mockData.getConvertControllerInitialized());
      expect(movementControler.movementRepo.allMovement.length, 1);
    },
  );

  test(
    'WHEN MovementRepository initialize THEN movementRepository.allMovement.length',
    () {
      MovementRepository movementRepository = MovementRepository();
      movementRepository.addMovement(mockData.getMovementModel());
      expect(movementRepository.allMovement.length, 1);
    },
  );
  test(
    ' GetCoinPriceResponse',
    () {
      GetCoinPriceResponse getCoinPriceResponse =
          GetCoinPriceResponse(price: mockData.getCoinValueResponseList());

      expect(getCoinPriceResponse.toViewData().length,
          mockData.getCoinValueResponseList().length);
    },
  );
}

class CoinPricesRepositoryMock extends Mock implements CoinPricesRepository {}
