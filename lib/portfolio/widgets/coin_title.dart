import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/util.dart';
import '../provider/wallet_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CoinTitle extends HookConsumerWidget {
  const CoinTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);
    return Padding(
      padding: const EdgeInsets.only(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppLocalizations.of(context)!.crypto,
              style: TextStyle(
                  fontFamily: "Montserrat",
                  color: const Color.fromARGB(255, 244, 43, 87),
                  fontSize: size.height * .045)),
          IconButton(
              onPressed: () {
                viewWalletValue.state = !viewWalletValue.state;
              },
              icon: Icon(
                Util.getVisibilityIconData(viewWalletValue.state),
                size: size.height * 0.04,
              ))
        ],
      ),
    );
  }
}
