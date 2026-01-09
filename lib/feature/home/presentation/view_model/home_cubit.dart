import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';
import 'package:shopping_app/feature/home/domain/usecase/get_category_usecase.dart';
import 'package:shopping_app/feature/home/domain/usecase/get_product_usecase.dart';
import 'package:shopping_app/feature/home/presentation/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._categoryUseCase, this._getProductUseCase)
      : super(InitalState());
  final GetCategoryUseCase _categoryUseCase;
  final GetProductUseCase _getProductUseCase;
  List<Catergoryentity> listofCategories = [];
  List<Productentity> listofProducts = [];
  Future<void> getCategories() async {
    emit(HomaLoadingSate());
    final reslutt = await _categoryUseCase.call();
    switch (reslutt) {
      case SuccessAPI<List<Catergoryentity>>():
        listofCategories = reslutt.data ?? [];
        emit(HomeSucessState());
      case ErrorAPI<List<Catergoryentity>>():
        emit(HomeErrorState());
    }
  }

  Future<void> getProducts() async {
    emit(HomaLoadingSate());
    final result = await _getProductUseCase.call();
    switch (result) {
      case SuccessAPI<List<Productentity>>():
        listofProducts = result.data ?? [];
        emit(HomeSucessState());
      case ErrorAPI<List<Productentity>>():
        emit(HomeErrorState());
    }
  }
}
