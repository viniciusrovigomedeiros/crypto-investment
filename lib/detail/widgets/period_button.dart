import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/detail_provider.dart';

class PeriodButton extends HookConsumerWidget {
  const PeriodButton({
    Key? key,
    required this.period,
  }) : super(key: key);

  final int period;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailController = ref.watch(detailControllerProvider);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 12, bottom: 20),
      child: SizedBox(
        height: size.height * .032,
        width: size.width * .08,
        child: MaterialButton(
          splashColor: Colors.transparent,
          elevation: detailController.period == period ? 3 : 0,
          color: detailController.period == period
              ? const Color.fromARGB(255, 206, 206, 206)
              : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          onPressed: () {
            detailController.setPeriod(period);
          },
          padding: EdgeInsets.zero,
          child: AutoSizeText(
            '${period}D',
            style: TextStyle(
              fontSize: size.height * .013,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat",
            ),
          ),
        ),
      ),
    );
  }
}
