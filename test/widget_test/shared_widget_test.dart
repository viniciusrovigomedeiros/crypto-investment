import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:warren_task_one/movements/view/movements_page.dart';
import 'package:warren_task_one/movements/wigdet/movements_body.dart';
import 'package:warren_task_one/portfolio/view/portfolio_page.dart';
import 'package:warren_task_one/shared/utils/assets.dart';
import 'package:warren_task_one/shared/widget/navigation_bar/bottom_nav_bar.dart';
import 'package:warren_task_one/shared/widget/navigation_bar/bottom_nav_button.dart';
import '../helpers/setup_widget.dart';

void main() {
  group('Testing shared widgets', () {
    testWidgets(
        'WHEN tap BottomNavButton(PortfolioPage)  THEN PortfolioPage call',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            BottomNavButton(
              buttonName: faker.lorem.toString(),
              icons: warrenIcons,
              pageIndex: 0,
              route: PortfolioPage.route,
            ));

        final image = find.byType(Image);
        final text = find.byType(Text);
        final inkwell = find.byType(InkWell);
        final column = find.byType(Column);

        expect(image, findsOneWidget);
        expect(text, findsOneWidget);
        expect(inkwell, findsOneWidget);
        expect(column, findsOneWidget);
        await tester.tap(inkwell);
        await tester.pumpAndSettle();
        expect(find.byType(PortfolioPage), findsOneWidget);
      });
    });
    testWidgets(
        'WHEN tap BottomNavButton(MovementPage)  THEN MovementPage call',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            BottomNavButton(
              buttonName: faker.lorem.toString(),
              icons: cryptoIcons,
              pageIndex: 1,
              route: MovementsPage.route,
            ));

        final image = find.byType(Image);
        final text = find.byType(Text);
        final inkwell = find.byType(InkWell);
        final column = find.byType(Column);

        expect(image, findsOneWidget);
        expect(text, findsOneWidget);
        expect(inkwell, findsOneWidget);
        expect(column, findsOneWidget);
        await tester.tap(inkwell);
        await tester.pumpAndSettle();
        expect(find.byType(MovementBody), findsOneWidget);
      });
    });
    testWidgets(
        'WHEN initialize BottomNavBar and tap BottomNavButton THEN build BottomNavBar  ',
        (WidgetTester tester) async {
      await loadPage(tester, const BottomNavBar(pageIndex: 1));

      final buttonNavButton = find.byType(BottomNavButton);

      expect(buttonNavButton, findsAtLeastNWidgets(2));
      await tester.tap(buttonNavButton.first, warnIfMissed: false);
      await tester.tap(buttonNavButton.last, warnIfMissed: false);
    });
  });
}
