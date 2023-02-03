import 'package:flutter/material.dart';
import 'package:warren_task_one/portfolio/model/coin_view_data.dart';

import '../widgets/body_convert.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConvertPage extends StatelessWidget {
  const ConvertPage({
    Key? key,
    this.coin,
  }) : super(key: key);
  static const route = '/convert-page';
  final CoinViewData? coin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text(
            AppLocalizations.of(context)!.convert,
          ),
        ),
        body: BodyConvert(
          coin: coin,
        ));
  }
}
