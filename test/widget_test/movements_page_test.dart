import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:warren_task_one/movements/wigdet/description_bottom_sheet.dart';
import 'package:warren_task_one/movements/wigdet/entry_coint_description.dart';
import 'package:warren_task_one/movements/wigdet/movement_item.dart';
import 'package:warren_task_one/movements/wigdet/movements_list.dart';
import 'package:warren_task_one/movements/wigdet/out_coin_description.dart';
import 'package:warren_task_one/movements/wigdet/values_text.dart';

import '../helpers/mock_data.dart';
import '../helpers/setup_widget.dart';

void main() {
  MockData mockData = MockData();

  group(
    'Testing movements page',
    () {
      testWidgets(
        'WHEN  initiaze MovementsList THEN build MovementItem ',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              await loadPage(
                tester,
                MovementsList(
                  movementsList: mockData.getMovementList(),
                ),
              );
              expect(find.byType(MovementItem), findsAtLeastNWidgets(2));
            },
          );
        },
      );
      testWidgets(
        'WHEN initialize ValuesText  THEN build ValuesText widgets ',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              await loadPage(
                  tester,
                  ValuesText(
                    text: faker.lorem.toString(),
                  ));
              expect(find.byType(AutoSizeText), findsOneWidget);
            },
          );
        },
      );
      testWidgets(
        'WHEN initialize OutCoinDescription  THEN build OutCoinDescription widgets',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              await loadPage(tester,
                  OutCoinDescription(movement: mockData.getMovementModel()));
              expect(find.byType(AutoSizeText), findsAtLeastNWidgets(7));
            },
          );
        },
      );
      testWidgets(
        'WHEN initialize EntryCoinDescription  THEN build EntryCoinDescription widgets',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              await loadPage(tester,
                  EntryCoinDescription(movement: mockData.getMovementModel()));
              expect(find.byType(AutoSizeText), findsAtLeastNWidgets(7));
            },
          );
        },
      );
      testWidgets(
        'WHEN initialize DescriptionBottomSheet  THEN build DescriptionBottomSheet widgets',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              await loadPage(
                  tester,
                  DescriptionBottomSheet(
                      movement: mockData.getMovementModel()));
              expect(find.byType(OutCoinDescription), findsOneWidget);
              expect(find.byType(EntryCoinDescription), findsOneWidget);
            },
          );
        },
      );
    },
  );
}
