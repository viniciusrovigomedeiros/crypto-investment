import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_task_one/detail/view/detail_page.dart';
import 'package:warren_task_one/detail/widgets/body_detail.dart';
import 'package:warren_task_one/detail/widgets/coin_price.dart';
import 'package:warren_task_one/detail/widgets/coin_ticker.dart';
import 'package:warren_task_one/detail/widgets/coin_title_detail.dart';
import 'package:warren_task_one/detail/widgets/convert_button.dart';
import 'package:warren_task_one/detail/widgets/currency_variation_value.dart';
import 'package:warren_task_one/detail/widgets/detail_coin_value.dart';
import 'package:warren_task_one/detail/widgets/detail_description.dart';
import 'package:warren_task_one/detail/widgets/detail_header.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:warren_task_one/detail/widgets/loading_details.dart';
import 'package:warren_task_one/detail/widgets/period_button.dart';
import '../helpers/mock_data.dart';
import '../helpers/setup_widget.dart';

void main() {
  MockData mockData = MockData();
  group(
    'Testing detail page',
    () {
      testWidgets(
        'WHEN initialize DetailsHeader THEN build DetailsHeader widgets',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              await loadPage(
                tester,
                DetailsHeader(
                  wallet: mockData.getWalletViewData(),
                ),
              );
              expect(find.byType(CoinTitleDetail), findsOneWidget);
              expect(find.byType(CoinTicker), findsOneWidget);
              expect(find.byType(CoinPrice), findsOneWidget);
            },
          );
        },
      );
      testWidgets(
        'WHEN initialize DetailCoinValue THEN build DetailCoinValue widgets',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              await loadPage(
                tester,
                DetailCoinValue(
                  description: faker.lorem.toString(),
                  value: faker.currency.toString(),
                ),
              );
              expect(
                find.byType(Text),
                findsAtLeastNWidgets(2),
              );
            },
          );
        },
      );
      testWidgets(
        'WHEN initialize and press PeriodButton  THEN build PeriodButton widgets',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              await loadPage(
                tester,
                const PeriodButton(
                  period: 5,
                ),
              );
              expect(find.byType(MaterialButton), findsOneWidget);
              expect(find.byType(SizedBox), findsOneWidget);
              expect(find.byType(Padding), findsWidgets);
              expect(find.byType(AutoSizeText), findsOneWidget);
              await tester.press(find.byType(MaterialButton));
              await tester.pumpAndSettle();
            },
          );
        },
      );
      testWidgets(
        'WHEN initialize DetailDescription THEN build DetailDescription widgets',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              await loadPage(
                tester,
                DetailDescription(
                  data: const [],
                  wallet: mockData.getWalletViewData(),
                ),
              );
              expect(find.byType(DetailCoinValue), findsAtLeastNWidgets(3));
              expect(find.byType(CurrencyVariationValue), findsOneWidget);
              expect(find.byType(ConvertButton), findsOneWidget);
            },
          );
        },
      );
      testWidgets(
        'WHEN initialize DetailsPage THEN build DetailsPage widgets',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              DetailsPage detailsPage = DetailsPage(
                walletViewData: mockData.getWalletViewData(),
              );
              await loadPage(tester, detailsPage);
              expect(find.byType(BodyDetail), findsOneWidget);
            },
          );
        },
      );
      testWidgets(
        'WHEN initialize LoadingDetails THEN build LoadingDetails widgets',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              await loadPage(tester, const LoadingDetails());
              expect(find.byType(Container), findsWidgets);
            },
          );
        },
      );
    },
  );
}
