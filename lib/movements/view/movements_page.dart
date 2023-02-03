import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/movements/wigdet/movements_body.dart';

import '../../shared/widget/navigation_bar/bottom_nav_bar.dart';

class MovementsPage extends HookConsumerWidget {
  static const route = '/movements-page';
  const MovementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
        bottomNavigationBar: BottomNavBar(pageIndex: 1),
        body: SafeArea(
          child: MovementBody(),
        ));
  }
}
