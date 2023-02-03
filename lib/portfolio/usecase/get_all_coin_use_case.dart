import '../mapper/coin_mapper.dart';
import '../model/coin_view_data.dart';
import '../../shared/repository/coin_repository.dart';

class GetAllCoinUseCase {
  final CoinRepository repository;
  GetAllCoinUseCase({
    required this.repository,
  });
  Future<List<CoinViewData>> execute() async {
    final response = await repository.getAllCoins();

    return response.toViewData();
  }
}
