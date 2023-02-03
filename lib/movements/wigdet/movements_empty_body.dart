import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovimentsEmptyBody extends StatelessWidget {
  const MovimentsEmptyBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            color: const Color.fromARGB(255, 244, 43, 87),
            Icons.currency_exchange_sharp,
            size: size.height * .10,
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.02),
            child: Text(
              AppLocalizations.of(context)!.movementsEmpty,
              style: TextStyle(
                fontFamily: "Mansny regular",
                fontWeight: FontWeight.bold,
                fontSize: size.height * .025,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
