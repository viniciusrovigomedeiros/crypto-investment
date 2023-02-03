import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/coin_view_data.dart';
import '../provider/convert_provider.dart';

class BottomCoinList extends StatefulHookConsumerWidget {
  const BottomCoinList({
    super.key,
  });
  @override
  BottomCoinListState createState() => BottomCoinListState();
}

class BottomCoinListState extends ConsumerState<BottomCoinList> {
  late List<CoinViewData> filterCoinList =
      ref.watch(allCoinsControllerProvider).coins;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final allCoinsController = ref.watch(allCoinsControllerProvider);
    final convertController = ref.watch(convertControllerProvider);

    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 75, 75, 75),
              blurRadius: 15,
            )
          ],
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17), topRight: Radius.circular(17))),
      height: size.height * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.018),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 185, 186, 199),
              ),
              height: size.height * 0.009,
              width: size.width * .13,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 25, horizontal: size.height * .02),
            child: Text(
              'Escolha uma moeda para converter',
              style: TextStyle(
                  fontFamily: "Mansny regular",
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * .021,
                  color: const Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 244, 43, 87),
            ),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.search,
                  color: Color.fromARGB(210, 255, 255, 255),
                ),
              ),
              Expanded(
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      filterCoinList = allCoinsController.coins
                          .where((coin) => coin.name
                              .toLowerCase()
                              .contains((text.toLowerCase())))
                          .toList();
                    });
                  },
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.050,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Procurar moeda',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              )
            ]),
          ),
          Expanded(
              child: Visibility(
            visible: filterCoinList.isNotEmpty,
            replacement: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Não foi possível encontrar a moeda',
                    style: TextStyle(
                        fontFamily: "Mansny regular",
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * .021,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ),
            child: ListView.builder(
              itemCount: filterCoinList.length,
              itemBuilder: (context, index) {
                return Card(
                    borderOnForeground: true,
                    elevation: 4,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(3),
                      onTap: () {
                        convertController
                            .setCoinToConvert(filterCoinList[index]);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(size.height * .015),
                        height: size.height * 0.10,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Color.fromARGB(255, 227, 228, 235),
                              width: 2,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: size.width * .05),
                              width: size.width * .12,
                              height: size.height * .07,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          filterCoinList[index].image!.small))),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        filterCoinList[index].name,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                  Text(
                                    filterCoinList[index].symbol,
                                    style: TextStyle(
                                        fontFamily: "Mansny-regular",
                                        fontWeight: FontWeight.w300,
                                        fontSize: size.height * .018,
                                        color: const Color.fromARGB(
                                            255, 154, 154, 163)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ))
        ],
      ),
    );
  }
}
