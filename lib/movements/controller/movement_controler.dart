import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../convert/controller/convert_controller.dart';
import '../model/movement_model.dart';
import '../repository/movement_repository.dart';

class MovementControler extends ChangeNotifier {
  MovementRepository movementRepo;

  MovementControler(
    this.movementRepo,
  );

  List<MovementModel> getAllMoviments() => movementRepo.getAllMoviments();

  void addMovement(ConvertController convertController) {
    movementRepo.addMovement(MovementModel(
        coinEntry: convertController.coinToConvert,
        coinOut: convertController.currentCoin,
        movementEntry: convertController.getReceiveValue(),
        movementOut: convertController.getConvertDecimalValue(),
        movementDate: DateFormat("dd/MM/yyyy").format(DateTime.now()),
        dolarValue: convertController.getDolarFormatedValue()));
  }
}
