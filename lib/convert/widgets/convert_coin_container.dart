import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/convert/widgets/bottom_coin_list.dart';

import '../provider/convert_provider.dart';

class ConvertCoinContainer extends HookConsumerWidget {
  const ConvertCoinContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final convertController = ref.watch(convertControllerProvider);
    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          backgroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          context: context,
          builder: (BuildContext context) {
            return const BottomCoinList();
          },
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .007, vertical: size.height * .005),
        width: size.width * 0.30,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 227, 228, 235),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        height: size.height * 0.043,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: size.width * .009),
                  width: size.width * .08,
                  height: size.height * .04,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              convertController.coinToConvert.image!.small))),
                ),
                AutoSizeText(
                  convertController.coinToConvert.symbol,
                  maxLines: 1,
                  style: const TextStyle(
                    fontFamily: "Mansny-regular",
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 22,
            )
          ],
        ),
      ),
    );
  }
}
