import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/movements/model/movement_model.dart';
import 'package:warren_task_one/movements/provider/movement_provider.dart';
import 'package:warren_task_one/movements/wigdet/movements_list.dart';
import 'package:warren_task_one/shared/widget/text_page_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'movements_empty_body.dart';

class MovementBody extends HookConsumerWidget {
  const MovementBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movementControler = ref.watch(movementControllerProvider);
    List<MovementModel> allMovements = movementControler.getAllMoviments();
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * 0.04, top: size.height * 0.035),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.04),
            child: TextPageHeader(
                title: AppLocalizations.of(context)!.movementsAppBar,
                fontSize: size.height * .045),
          ),
          Expanded(
            child: Visibility(
              visible: allMovements.isNotEmpty,
              replacement: const MovimentsEmptyBody(),
              child: MovementsList(movementsList: allMovements),
            ),
          )
        ],
      ),
    );
  }
}
