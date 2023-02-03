
import '../convert/view/convert_page.dart';

import '../detail/view/detail_page.dart';
import '../movements/view/movements_page.dart';
import '../portfolio/view/portfolio_page.dart';
import '../review/view/review_page.dart';
import '../sucess/view/success_page.dart';

var appRoutes = {
  PortfolioPage.route: (context) => const PortfolioPage(),
  MovementsPage.route: (context) => const MovementsPage(),
  DetailsPage.route: (context) => const DetailsPage(),
  ConvertPage.route: (context) => const ConvertPage(),
  ReviewPage.route: (context) => const ReviewPage(),
  SuccessPage.route: (context) => const SuccessPage()
};
