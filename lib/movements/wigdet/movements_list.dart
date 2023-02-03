import 'package:flutter/material.dart';
import 'package:warren_task_one/movements/wigdet/movement_item.dart';

import '../model/movement_model.dart';

class MovementsList extends StatelessWidget {
  const MovementsList({
    super.key,
    required this.movementsList,
  });

  final List<MovementModel> movementsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movementsList.length,
      itemBuilder: (context, index) {
        return MovementItem(movement: movementsList[index]);
      },
    );
  }
}
