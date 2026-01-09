import 'package:shopping_app/core/network/result_api.dart';

import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/repo/repository/home_repo.dart';

class GetProductUseCase {
  GetProductUseCase(this._homeRepo);
  HomeRepo _homeRepo;

  Future<ResultAPI<List<Productentity>>> call() async =>
      await _homeRepo.getproducts();
}

GetProductUseCase injectableGeyProductUseCase() =>
    GetProductUseCase(injectHomeRepo);
