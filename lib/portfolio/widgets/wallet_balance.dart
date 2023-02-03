import 'package:auto_size_text/auto_size_text.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/utils/util.dart';
import '../provider/wallet_provider.dart';

class WalletBalance extends HookConsumerWidget {
  const WalletBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final viewWalletValue = ref.watch(viewWalletValueProvider.state);
    final walletController = ref.watch(walletControllerProvider);
    return AnimatedContainer(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Util.getContainerValueColor(viewWalletValue.state)),
        duration: const Duration(milliseconds: 700),
        width: size.width * 0.55,
        height: size.height * .050,
        child: Visibility(
            visible: (viewWalletValue.state),
            child: AutoSizeText(
                NumberFormat.simpleCurrency(name: 'US\$ ', decimalDigits: 2)
                    .format(DecimalIntl(walletController.getTotalBalance())),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontSize: size.height * .045,
                ))));
  }
}
