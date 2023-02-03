import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:warren_task_one/portfolio/widgets/coin_item.dart';
import 'package:warren_task_one/portfolio/widgets/coin_list.dart';
import 'package:warren_task_one/portfolio/widgets/coin_title.dart';
import 'package:warren_task_one/portfolio/widgets/success_loading_body.dart';
import '../helpers/mock_data.dart';
import '../helpers/setup_widget.dart';

void main() {
  MockData mockData = MockData();
  group('Testing portfolio page', () {
    testWidgets('WHEN visibility IconButton tap THEN visibility icon change',
        (WidgetTester tester) async {
      await loadPage(tester, const CoinTitle());
      final visibilityIconData = find.byIcon(Icons.visibility_off);

      expect(find.text('Crypto'), findsOneWidget);
      expect(visibilityIconData, findsOneWidget);
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(visibilityIconData, findsNothing);
    });
    testWidgets('WHEN visibility IconButton tap THEN wallet balance hide',
        (WidgetTester tester) async {
      await loadPage(tester, const SuccessLoadingBody());
      final totalBalance = find.byType(AutoSizeText);

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(totalBalance, findsNothing);
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(totalBalance, findsOneWidget);
    });
    testWidgets('WHEN intialize CoinItem THEN build CoinItem widgets  ',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(tester, CoinItem(wallet: mockData.getWalletViewData()));

        final gesture = find.byType(GestureDetector);
        expect(gesture, findsOneWidget);
      });
    });
    testWidgets('WHEN intialize CoinList THEN build CoinList widgets',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(tester, const CoinList());

        final coinItem = find.byType(CoinItem);
        final listview = find.byWidget(ListView());

        expect(coinItem, findsNothing);
        expect(listview, findsNothing);
      });
    });
  });
}
