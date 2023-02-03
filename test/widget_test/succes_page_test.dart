import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:warren_task_one/shared/widget/text_page_header.dart';
import 'package:warren_task_one/sucess/view/success_page.dart';
import '../helpers/setup_widget.dart';

void main() {
  group('Testing success page', () {
    testWidgets(
        'WHEN initialize SuccessBody  initialize THEN build body widgets',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(tester, const SuccessPage());

        expect(find.byType(TextPageHeader), findsOneWidget);
        expect(find.byType(Text), findsAtLeastNWidgets(2));
        expect(find.byType(CircleAvatar), findsOneWidget);
        expect(find.byType(Column), findsWidgets);
        expect(find.byType(Icon), findsWidgets);
        expect(find.byType(IconButton), findsOneWidget);
        tester.tap(find.byType(IconButton));
      });
    });
  });
}
