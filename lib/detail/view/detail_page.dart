import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../portfolio/model/wallet_view_data.dart';
import '../widgets/body_detail.dart';

class DetailsPage extends StatelessWidget {
  static const route = '/details-page';

  final WalletViewData? walletViewData;
  const DetailsPage({
    Key? key,
    this.walletViewData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          AppLocalizations.of(context)!.details,
        ),
      ),
      body: BodyDetail(
          wallet: walletViewData ??
              ModalRoute.of(context)!.settings.arguments as WalletViewData),
    );
  }
}
