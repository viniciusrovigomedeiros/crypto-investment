import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:warren_task_one/portfolio/model/coin_view_data.dart';

class CurrentCoinContainer extends StatelessWidget {
  const CurrentCoinContainer({
    super.key,
    required this.coin,
  });

  final CoinViewData coin;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .007, vertical: size.height * .005),
      width: size.width * 0.30,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 238, 245),
        border: Border.all(
          color: const Color.fromARGB(255, 227, 228, 235),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      height: size.height * 0.043,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: size.width * .02),
            width: size.width * .08,
            height: size.height * .04,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(coin.image!.small))),
          ),
          AutoSizeText(
            coin.symbol,
            maxLines: 1,
            style: const TextStyle(
              fontFamily: "Mansny-regular",
            ),
          ),
        ],
      ),
    );
  }
}
