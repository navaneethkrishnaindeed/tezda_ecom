import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tezda_ecom/application/home/home_controller.dart';

import '../../../../infrastructure/products_repository/i_repo.dart';

part 'products_state.dart';
part 'products_cubit.freezed.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsState.initial());
  IProductRepo repository = IProductRepo();

  getAllProducts() async {
    var products = await repository.getAllProducts();
    HomeController.products.value = products;
  }

  getProductsByCategoryID({required String category_ID}) async {
    var products =
        await repository.getCategoryProducts(category_ID: category_ID);
    HomeController.products.value = products;
  }

  getSingleProduct({required String product_ID}) async {
   
    var product = await repository.getSingleProduct(product_ID: product_ID);
    HomeController.product.value = product;
  }
}
