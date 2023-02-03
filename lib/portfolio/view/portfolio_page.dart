import 'package:flutter/material.dart';

import '../../shared/widget/navigation_bar/bottom_nav_bar.dart';
import '../widgets/portfolio_body.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  static const route = '/portfolio-page';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavBar(pageIndex: 0),
      backgroundColor: Colors.white,
      body: BodyPortfolio(),
    );
  }
}
