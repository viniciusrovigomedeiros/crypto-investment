import 'package:warren_task_one/movements/model/movement_model.dart';

class MovementRepository {
  List<MovementModel> allMovement = [];

  List<MovementModel> getAllMoviments() => allMovement;

  void addMovement(MovementModel movement) {
    allMovement.add(movement);
  }
}
