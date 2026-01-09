import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/core/constants/app_apis.dart';
import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/data/model/categories_response_dto.dart';
import 'package:shopping_app/feature/home/data/model/product_response_dto.dart';

class HomeApi {
  Future<ResultAPI<List<CatergoriesResponseDto>>> getacategory() async {
    //https://api.escuelajs.co/api/v1/categories/

    try {
      Uri url = Uri.https(AppApis.baseUrl, AppApis.GategoryUrl);
      var response = await http.get(url);
      var responseBody = response.body;
      List<dynamic> json = jsonDecode(responseBody);
      List<CatergoriesResponseDto> listOfCategories = json
          .map<CatergoriesResponseDto>(
              (category) => CatergoriesResponseDto.fromJson(category))
          .toList();
      return SuccessAPI<List<CatergoriesResponseDto>>(data: listOfCategories);
    } catch (e) {
      return ErrorAPI<List<CatergoriesResponseDto>>(messageError: e.toString());
    }
  }

  Future<ResultAPI<List<ProductResponseDto>>> getproducts() async {
//https://api.escuelajs.co/api/v1/products/

    try {
      Uri url = Uri.https(AppApis.baseUrl, AppApis.ProductUrl);
      var response = await http.get(url);
      var responsebody = response.body;
      List<dynamic> json = jsonDecode(responsebody);
      List<ProductResponseDto> listofproducts =
          json.map((product) => ProductResponseDto.fromJson(product)).toList();
      return SuccessAPI<List<ProductResponseDto>>(data: listofproducts);
    } catch (e) {
      return ErrorAPI<List<ProductResponseDto>>(messageError: e.toString());
    }
  }
}

HomeApi injectHomeApi() => HomeApi();
