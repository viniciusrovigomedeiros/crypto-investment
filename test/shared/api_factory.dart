import 'package:faker/faker.dart';

class ApiFactory {
  static Map<String, dynamic> getAllCoins() => {
        "id": faker.lorem.toString(),
        "symbol": faker.lorem.toString(),
        "name": faker.lorem.toString(),
        "image": {
          "thumb": faker.lorem.toString(),
          "small": faker.lorem.toString(),
          "large": faker.lorem.toString(),
        },
        "market_data": {
          "current_price": {
            "usd": faker.randomGenerator.decimal().toDouble(),
          },
          "price_change_percentage_24h":
              faker.randomGenerator.decimal().toDouble(),
        },
      };

  static Map<String, dynamic> getCoinHistoryPrices() => {
        "prices": [
          [1659754906410, 23276.748783798543],
          [1659758427078, 23203.53378919455],
          [1659762098564, 23227.182484320372],
          [1659765739625, 23204.679549688728]
        ]
      };
}
