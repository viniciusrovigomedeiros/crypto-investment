import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/convert/controller/convert_controller.dart';

import '../../portfolio/controller/allcoins_controller.dart';

final allCoinsControllerProvider =
    ChangeNotifierProvider((ref) => AllCoinsController());

final convertControllerProvider =
    ChangeNotifierProvider((ref) => ConvertController());
