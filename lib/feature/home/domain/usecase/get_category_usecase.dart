import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/repo/repository/home_repo.dart';

class GetCategoryUseCase {
  GetCategoryUseCase(this._homeRepo);
  HomeRepo _homeRepo;

  Future<ResultAPI<List<Catergoryentity>>> call() async =>
      await _homeRepo.getacategory();
}

GetCategoryUseCase injectableGetCategoryUseCase() =>
    GetCategoryUseCase(injectHomeRepo);
