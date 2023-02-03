import 'package:flutter/material.dart';
import '../widget/review_body.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  static const route = '/review-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          AppLocalizations.of(context)!.review,
          style: const TextStyle(
            fontFamily: "Mansny-regular",
          ),
        ),
      ),
      body: const BodyReview(),
    );
  }
}
