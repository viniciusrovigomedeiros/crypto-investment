import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../review/view/review_page.dart';
import '../provider/convert_provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TotalConvert extends HookConsumerWidget {
  const TotalConvert({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final convertController = ref.watch(convertControllerProvider);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03, vertical: size.height * 0.010),
      height: size.height * 0.1,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 227, 228, 235),
            width: 2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  AppLocalizations.of(context)!.total,
                  style: const TextStyle(
                      fontFamily: "Mansny-LIGHT",
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 150, 150, 150)),
                ),
              ),
              Text(
                convertController.getConvertValue(),
                style: TextStyle(
                    fontFamily: "Mansny", fontSize: size.height * 0.02),
              )
            ],
          ),
          FloatingActionButton(
            elevation: 5,
            backgroundColor: convertController.isValidConversion
                ? const Color.fromARGB(255, 244, 43, 87)
                : const Color.fromARGB(255, 150, 150, 150),
            onPressed: () {
              if (convertController.isValidConversion) {
                Navigator.pushNamed(
                  context,
                  ReviewPage.route,
                );
              }
            },
            child: const Icon(
              Icons.arrow_forward,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
