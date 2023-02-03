import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:warren_task_one/convert/controller/convert_controller.dart';
import 'package:warren_task_one/detail/controller/detail_controller.dart';
import 'package:warren_task_one/movements/model/movement_model.dart';
import 'package:warren_task_one/portfolio/controller/allcoins_controller.dart';
import 'package:warren_task_one/portfolio/controller/wallet_controller.dart';
import 'package:warren_task_one/portfolio/model/coin_view_data.dart';
import 'package:warren_task_one/portfolio/model/wallet_view_data.dart';
import 'package:warren_task_one/shared/api/models/coin/coin_result_image_response.dart';
import 'package:warren_task_one/shared/api/models/coin/coin_result_market_data_current_price.dart';
import 'package:warren_task_one/shared/api/models/coin/coin_result_market_data_response.dart';
import 'package:warren_task_one/shared/api/models/coin/coin_result_response.dart';
import 'package:warren_task_one/shared/api/models/coin_prices/coin_price_response.dart';

class MockData {
  WalletController getWalletControllerInitialized() {
    WalletController walletController = WalletController();

    walletController.selectedWalletCoin = getWalletViewData();
    walletController.coins = [getWalletViewData()];
    walletController.selectedWalletCoin = getWalletViewData();
    return walletController;
  }

  ConvertController getConvertControllerInitialized() {
    ConvertController convertController = ConvertController();
    convertController.initValues(getCoinViewData());
    convertController.currentAssetPrice = 244;
    convertController.refresh(getCoinViewData(), getWalletViewData());
    convertController.setConvertValue('128102');
    convertController.setCoinPercent('11232');
    return convertController;
  }

  AllCoinsController getAllCoinControllerInitialized() {
    AllCoinsController allCoinsController = AllCoinsController();
    allCoinsController.coins = [getCoinViewData()];

    return allCoinsController;
  }

  WalletViewData getWalletViewData() {
    return WalletViewData(
        userBalance: Decimal.fromInt(6546545),
        coin: CoinViewData(
            id: faker.guid.guid(),
            symbol: faker.guid.guid(),
            name: faker.guid.guid(),
            image: CoinResultImageResponse('thumb', 'small', 'large'),
            market_data: CoinResultMarketDataResponse(
                CoinResultMarketDataCurrentPrice(123123), 123123)));
  }

  List<MovementModel> getMovementList() {
    return [
      MovementModel(
          coinEntry: getCoinViewData(),
          coinOut: getCoinViewData(),
          movementEntry: Decimal.parse('1212312'),
          movementOut: Decimal.parse('123123123'),
          movementDate: '2020/10/12',
          dolarValue: faker.lorem.toString()),
      MovementModel(
          coinEntry: getCoinViewData(),
          coinOut: getCoinViewData(),
          movementEntry: Decimal.parse('1212312'),
          movementOut: Decimal.parse('123123123'),
          movementDate: '2020/10/12',
          dolarValue: faker.lorem.toString()),
    ];
  }

  MovementModel getMovementModel() {
    return MovementModel(
        coinEntry: getCoinViewData(),
        coinOut: getCoinViewData(),
        movementEntry: Decimal.parse('1231'),
        movementOut: Decimal.parse('123'),
        movementDate: faker.date.toString(),
        dolarValue: faker.date.toString());
  }

  CoinViewData getCoinViewData() {
    return CoinViewData(
        id: 'bitcoin',
        symbol: 'BTC',
        name: 'Bitcoin',
        image: CoinResultImageResponse('thumb', 'small', 'large'),
        market_data: CoinResultMarketDataResponse(
            CoinResultMarketDataCurrentPrice(123123), 123123));
  }

  List<CoinViewData> getCoinViewDataList() {
    List<CoinViewData> allCoinsList = [];

    for (var i = 0; i < 20; i++) {
      allCoinsList.add(getCoinViewData());
    }

    return allCoinsList;
  }

  CoinResultResponse getCoinResultResponse() {
    return CoinResultResponse(
        'bitcoin',
        'btc',
        'Bitcoin',
        CoinResultImageResponse('thumb', 'small', 'large'),
        CoinResultMarketDataResponse(
            CoinResultMarketDataCurrentPrice(123123), 123123));
  }

  List<CoinResultResponse> getCoinResultResponseList() {
    List<CoinResultResponse> coinResultResponseList = [];

    for (var i = 0; i < 20; i++) {
      coinResultResponseList.add(getCoinResultResponse());
    }
    return coinResultResponseList;
  }

  DetailsController getDetailsController() {
    return DetailsController();
  }

  static const int date = 1657594850324;
  static const double value = 19967.60020613295;

  List<CoinValueResponse> getCoinValueResponseList() {
    List<CoinValueResponse> coinValueResponseList = [];
    for (var i = 0; i < 2000; i++) {
      coinValueResponseList
          .add(CoinValueResponse(values: [1657594850324, 19967.60020613295]));
    }
    return coinValueResponseList;
  }
}
