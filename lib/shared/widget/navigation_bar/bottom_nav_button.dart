import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_routes.dart';
import '../../utils/assets.dart';

// ignore: must_be_immutable
class BottomNavButton extends HookConsumerWidget {
  BottomNavButton({
    Key? key,
    required this.icons,
    required this.route,
    required this.buttonName,
    required this.pageIndex,
  }) : super(key: key);

  final Set<String> icons;
  final String route;
  final String buttonName;
  int pageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void setPageIndex() {
      if (icons == warrenIcons) {
        pageIndex = 0;
      } else {
        pageIndex = 1;
      }
    }

    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        setPageIndex();
        Navigator.pushReplacement(context, PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return appRoutes[route]!(context);
          },
        ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            height: size.height * 0.03,
            image: AssetImage(icons.elementAt(pageIndex)),
            fit: BoxFit.cover,
          ),
          Text(
            buttonName,
            style: TextStyle(fontSize: size.width * 0.03),
          )
        ],
      ),
    );
  }
}
