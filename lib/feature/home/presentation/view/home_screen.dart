import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/common/widget/product_item_widget.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/usecase/get_category_usecase.dart';
import 'package:shopping_app/feature/home/domain/usecase/get_product_usecase.dart';
import 'package:shopping_app/feature/home/presentation/view_model/home_cubit.dart';
import 'package:shopping_app/feature/home/presentation/view_model/home_state.dart';
import 'package:shopping_app/feature/home/presentation/widgets/tab_container_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit cubit;
  @override
  void initState() {
    cubit = HomeCubit(
        injectableGetCategoryUseCase(), injectableGeyProductUseCase());
    super.initState();
    //  HomeApi _api = HomeApi();
    //HomeDataSource _homeDataSource = HomeDataSourceImp(_api);
    //HomeRepo _homeRepo = HomeRepoImp(_homeDataSource);
    // cubit = HomeCubit(_homeRepo);
    cubit.getCategories();
    cubit.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text.rich(
              TextSpan(
                text: 'Hi !,\n',
                style: TextStyle(
                  color: Color(0xff212121),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: 'Let’s start your shopping',
                    style: TextStyle(
                      color: Color(0xff212121),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Categories",
              style: TextStyle(
                color: Color(0xff212121),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            BlocBuilder<HomeCubit, HomeState>(
                bloc: cubit,
                builder: (context, state) {
                  if (state is HomeErrorState) {
                    return Text(
                      state.toString(),
                      style: TextStyle(fontSize: 30),
                    );
                  }

                  if (state is HomeSucessState) {
                    return TabContainerWidget(
                      categories: cubit.listofCategories,
                      products: cubit.listofProducts,
                    );
                  }

                  return Skeletonizer(
                    enabled: true,
                    child: TabContainerWidget(
                      categories: dummyCategory,
                      products: cubit.listofProducts,
                    ),
                  );
                }),
            SizedBox(height: 16),
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (state is HomeErrorState) {
                  return const Text("error");
                }

                if (state is HomeSucessState &&
                    cubit.listofProducts.isNotEmpty) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: cubit.listofProducts.length,
                      itemBuilder: (context, index) {
                        return ProductItemWidget(
                          product: cubit.listofProducts[index],
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 163 / 288,
                        mainAxisSpacing: 18,
                        crossAxisSpacing: 30,
                        crossAxisCount: 2,
                      ),
                    ),
                  );
                }

                // loading
                return const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

List<Catergoryentity> get dummyCategory => List.generate(
      10,
      (index) => Catergoryentity(
        id: index,
        name: "dummy $index",
      ),
    );
