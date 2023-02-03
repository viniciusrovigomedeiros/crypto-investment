import 'dart:async';

import 'package:flutter/material.dart';
import 'package:warren_task_one/shared/widget/text_page_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../movements/view/movements_page.dart';

class SuccessBody extends StatefulWidget {
  const SuccessBody({
    super.key,
  });

  @override
  State<SuccessBody> createState() => _SuccessBodyState();
}

class _SuccessBodyState extends State<SuccessBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 214, 255, 223),
          radius: 35,
          child: Icon(
            Icons.check,
            color: Colors.green,
            size: 35,
          ),
        ),
        TextPageHeader(
          title: AppLocalizations.of(context)!.successTitle,
          fontSize: 35,
        ),
        Text(
          AppLocalizations.of(context)!.successSubtitle,
          style: const TextStyle(
            color: Colors.grey,
            fontFamily: "Mansny-light",
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
