import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/convert/provider/convert_provider.dart';
import 'package:warren_task_one/core/app_routes.dart';

import 'package:warren_task_one/detail/provider/detail_provider.dart';
import 'package:warren_task_one/movements/controller/movement_controler.dart';
import 'package:warren_task_one/movements/provider/movement_provider.dart';
import 'package:warren_task_one/movements/repository/movement_repository.dart';
import 'package:warren_task_one/portfolio/provider/wallet_provider.dart';
import 'package:warren_task_one/shared/api/models/coin_prices/coin_price_response.dart';

import 'mock_data.dart';

class SetupWidgetTester extends StatelessWidget {
  final Widget child;

  const SetupWidgetTester({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MockData mockData = MockData();
    final coinHistoryPricesProviderMock =
        FutureProvider<List<CoinValueResponse>?>(
            (ref) => mockData.getCoinValueResponseList());

    final detailControllerProviderMock = ChangeNotifierProvider(
      (ref) => mockData.getDetailsController(),
    );
    final movementControllerProviderMock = ChangeNotifierProvider(
        (ref) => MovementControler(MovementRepository()));
    final walletControllerProviderMock = ChangeNotifierProvider(
        (ref) => mockData.getWalletControllerInitialized());
    final convertControllerProviderMock = ChangeNotifierProvider(
        (ref) => mockData.getConvertControllerInitialized());
    final allCoinsControllerProviderMock = ChangeNotifierProvider(
        (ref) => mockData.getAllCoinControllerInitialized());

    return ProviderScope(
        overrides: [
          detailControllerProvider
              .overrideWithProvider(detailControllerProviderMock),
          coinHistoryPricesProvider
              .overrideWithProvider(coinHistoryPricesProviderMock),
          allCoinsControllerProvider
              .overrideWithProvider(allCoinsControllerProviderMock),
          convertControllerProvider
              .overrideWithProvider(convertControllerProviderMock),
          walletControllerProvider
              .overrideWithProvider(walletControllerProviderMock),
          movementControllerProvider
              .overrideWithProvider(movementControllerProviderMock)
        ],
        child: MaterialApp(
          routes: appRoutes,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Material(
            child: MediaQuery(
              data: const MediaQueryData(),
              child: child,
            ),
          ),
        ));
  }
}

Future<void> loadPage(WidgetTester tester, Widget child) async {
  var widget = SetupWidgetTester(
    child: child,
  );
  await tester.pumpWidget(widget);
}
