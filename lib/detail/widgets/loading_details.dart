import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingDetails extends StatelessWidget {
  const LoadingDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 27, horizontal: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7)),
                          height: size.height * .06,
                          width: size.width,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * .005),
                          child: Container(
                            decoration: getLoadingConatainerDecoration(),
                            height: size.height * .03,
                            width: size.width * .1,
                          ),
                        ),
                        Container(
                          decoration: getLoadingConatainerDecoration(),
                          height: size.height * .06,
                          width: size.width * .6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            decoration: getLoadingConatainerDecoration(),
                            height: size.height * .2,
                            width: size.width,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: getLoadingConatainerDecoration(),
                                height: size.height * .035,
                                width: size.width * .08,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: getLoadingConatainerDecoration(),
                                height: size.height * .035,
                                width: size.width * .08,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: getLoadingConatainerDecoration(),
                                height: size.height * .035,
                                width: size.width * .08,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: getLoadingConatainerDecoration(),
                                height: size.height * .035,
                                width: size.width * .08,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: getLoadingConatainerDecoration(),
                                height: size.height * .035,
                                width: size.width * .08,
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ],
            )),
        Expanded(
          child: Container(
            height: size.height * .12,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Color.fromARGB(255, 227, 228, 235),
                  width: 2,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .03, vertical: size.height * .02),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: getLoadingConatainerDecoration(),
                                height: 10,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Container(
                                decoration: getLoadingConatainerDecoration(),
                                height: 10,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Container(
                                decoration: getLoadingConatainerDecoration(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Container(
                                decoration: getLoadingConatainerDecoration(),
                                height: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        )
      ],
    );
  }

  BoxDecoration getLoadingConatainerDecoration() {
    return BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(7));
  }
}
