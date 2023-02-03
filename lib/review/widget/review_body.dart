import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:warren_task_one/sucess/view/success_page.dart';

import '../../convert/provider/convert_provider.dart';
import '../../movements/provider/movement_provider.dart';
import '../../shared/widget/text_page_header.dart';
import '../../detail/widgets/detail_coin_value.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BodyReview extends StatefulHookConsumerWidget {
  const BodyReview({
    super.key,
  });
  @override
  BodyReviewState createState() => BodyReviewState();
}

class BodyReviewState extends ConsumerState<BodyReview> {
  bool btnConverIsPressed = false;
  @override
  Widget build(BuildContext context) {
    final RoundedLoadingButtonController btnController =
        RoundedLoadingButtonController();
    final convertController = ref.watch(convertControllerProvider);
    final movementControler = ref.watch(movementControllerProvider);

    Future<void> confirmConvertion() async {
      movementControler.addMovement(convertController);
      setState(() {
        btnConverIsPressed = true;
      });

      Future.delayed(const Duration(seconds: 2)).then((value) {
        btnController.success();
        Future.delayed(const Duration(seconds: 1)).then((value) {
          Navigator.pushNamed(context, SuccessPage.route);
        });
      });
    }

    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.035),
          child: TextPageHeader(
              fontSize: size.height * .048,
              title: AppLocalizations.of(context)!.reviewTitle),
        ),
        SizedBox(
          child: Column(
            children: [
              DetailCoinValue(
                description: AppLocalizations.of(context)!.convert,
                value: convertController.getConvertedFormatedValue(),
              ),
              DetailCoinValue(
                description: AppLocalizations.of(context)!.review,
                value: convertController.getReceiveFormatedValue(),
              ),
              DetailCoinValue(
                description: AppLocalizations.of(context)!.exchangeRate,
                value: convertController.getExchangeValue(),
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: RoundedLoadingButton(
                    duration: const Duration(milliseconds: 200),
                    elevation: 5,
                    animateOnTap: true,
                    successColor: Colors.green,
                    borderRadius: btnConverIsPressed ? 40 : 8,
                    color: const Color.fromARGB(255, 224, 43, 87),
                    height: size.height * 0.08,
                    controller: btnController,
                    onPressed: confirmConvertion,
                    width: size.width,
                    child: Text(
                      AppLocalizations.of(context)!.convertCrypto,
                      style: TextStyle(
                        fontFamily: "Mansny regular",
                        color: Colors.white,
                        fontSize: size.height * 0.023,
                      ),
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
