import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:warren_task_one/detail/widgets/detail_coin_value.dart';
import 'package:warren_task_one/review/view/review_page.dart';
import 'package:warren_task_one/review/widget/review_body.dart';

import '../helpers/setup_widget.dart';

void main() {
  group('Testing review page ', () {
    testWidgets(
        'WHEN BodyReview initialize and convert THEN  build BodyReview widgets ',
        (tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(tester, const BodyReview());

        expect(find.byType(Padding), findsNWidgets(12));
        expect(find.byType(DetailCoinValue), findsWidgets);
        expect(find.byType(RoundedLoadingButton), findsWidgets);
        await tester.press(find.byType(RoundedLoadingButton),
            warnIfMissed: false);
        await tester.pumpAndSettle();
      });
    });
    testWidgets(
        'WHEN ReviewPage initialize and convert THEN  build ReviewPage widgets ',
        (tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(tester, const ReviewPage());

        expect(find.byType(BodyReview), findsOneWidget);
      });
    });
  });
}
