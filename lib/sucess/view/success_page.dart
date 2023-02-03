import 'package:flutter/material.dart';
import 'package:warren_task_one/shared/widget/navigation_bar/bottom_nav_bar.dart';
import '../widget/success_body.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  static const route = '/sucess-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(pageIndex: 0),
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const Center(child: SuccessBody()),
    );
  }
}
