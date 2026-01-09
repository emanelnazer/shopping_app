import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/data/repo/data_source/home_data_source_imp.dart';
import 'package:shopping_app/feature/home/data/repo/repo/home_repo_imp.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<ResultAPI<List<Catergoryentity>>> getacategory();
  Future<ResultAPI<List<Productentity>>> getproducts();
}

HomeRepo injectHomeRepo = HomeRepoImp(injectHomeDataSourceImp);
