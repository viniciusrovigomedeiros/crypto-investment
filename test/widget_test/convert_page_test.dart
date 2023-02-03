import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:warren_task_one/convert/view/convert_page.dart';
import 'package:warren_task_one/convert/widgets/body_convert.dart';
import 'package:warren_task_one/convert/widgets/bottom_coin_list.dart';
import 'package:warren_task_one/convert/widgets/current_coin_container.dart';
import 'package:warren_task_one/detail/widgets/convert_button.dart';
import 'package:warren_task_one/detail/widgets/currency_variation_value.dart';

import '../helpers/mock_data.dart';
import '../helpers/setup_widget.dart';

void main() {
  MockData mockData = MockData();
  group('Testing convert page', () {
    testWidgets(
        'WHEN initialize CurrentCoinContainer  THEN build CurrentCoinContainer widgets',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
          tester,
          CurrentCoinContainer(coin: mockData.getCoinViewData()),
        );
        expect(find.byType(AutoSizeText), findsOneWidget);
        expect(find.byType(Container), findsAtLeastNWidgets(2));
        expect(find.byType(Row), findsOneWidget);
        expect(find.byType(BoxDecoration), findsNothing);
      });
    });
    testWidgets(
        'WHEN initialize and press ConvertButton  THEN build ConvertButton and ConvertPage widgets',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(tester,
            ConvertButton(coin: mockData.getCoinViewData(), data: const []));
        expect(find.byType(MaterialButton), findsOneWidget);
        expect(find.byType(Padding), findsWidgets);
        expect(find.byType(Text), findsWidgets);
        await tester.press(find.byType(MaterialButton));
        await tester.pumpAndSettle();
        expect(find.byType(ConvertPage), findsNothing);
      });
    });
    testWidgets('WHEN initialize  ConvertPage  THEN build ConvertPage  widgets',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        ConvertPage convertPage = ConvertPage(
          coin: mockData.getCoinViewData(),
        );
        await loadPage(tester, convertPage);
        expect(find.byType(BodyConvert), findsOneWidget);
      });
    });
    testWidgets(
        'WHEN initialize  BottomCoinList  THEN build BottomCoinList widgets',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(tester, const BottomCoinList());
        expect(find.byType(Container), findsAtLeastNWidgets(6));
      });
    });

    testWidgets(
        'WHEN initialize  CurrencyVariationValue  THEN build CurrencyVariationValue widgets',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            CurrencyVariationValue(
              description: faker.lorem.toString(),
              value: faker.lorem.toString(),
            ));
        expect(find.byType(Container), findsOneWidget);
        expect(find.byType(AutoSizeText), findsWidgets);
      });
    });
  });
}
