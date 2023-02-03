import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/movements/repository/movement_repository.dart';

import '../controller/movement_controler.dart';

final movementControllerProvider =
    ChangeNotifierProvider((ref) => MovementControler(MovementRepository()));
