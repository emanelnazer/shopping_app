import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/data/api/home_api.dart';
import 'package:shopping_app/feature/home/data/model/categories_response_dto.dart';
import 'package:shopping_app/feature/home/data/model/product_response_dto.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/repo/data_source/home_data_source.dart';

class HomeDataSourceImp implements HomeDataSource {
  HomeDataSourceImp(this._api);
  HomeApi _api;
  @override
  Future<ResultAPI<List<Catergoryentity>>> getacategory() async {
    final resulthome = await _api.getacategory();
    switch (resulthome) {
      case SuccessAPI<List<CatergoriesResponseDto>>():
        return SuccessAPI<List<Catergoryentity>>(
            data: resulthome.data!.map((e) => e.toEntity()).toList());
      case ErrorAPI<List<CatergoriesResponseDto>>():
        return ErrorAPI<List<Catergoryentity>>(
            messageError: resulthome.toString());
    }
  }

  @override
  Future<ResultAPI<List<Productentity>>> getproducts() async {
    final resulthomeproduct = await _api.getproducts();
    switch (resulthomeproduct) {
      case SuccessAPI<List<ProductResponseDto>>():
        return SuccessAPI<List<Productentity>>(
            data: resulthomeproduct.data!.map((e) => e.toEntity()).toList());
      case ErrorAPI<List<ProductResponseDto>>():
        return ErrorAPI<List<Productentity>>(
            messageError: resulthomeproduct.toString());
    }
  }
}

HomeDataSource injectHomeDataSourceImp = HomeDataSourceImp(injectHomeApi());
