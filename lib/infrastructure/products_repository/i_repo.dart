import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tezda_ecom/domain/api/dio_client.dart';
import 'package:tezda_ecom/domain/api/endpoints.dart';

import '../../application/home/home_controller.dart';
import '../../domain/models/product/product.dart';

abstract class IProductRepo {
  factory IProductRepo() = RepositoryImpl;
  List<Product> getAllProducts();
  List<String> getAllCategories();
  List<Product> getCategoryProducts({required String category_ID});
  Product getSingleProduct({required String product_ID});
}

class RepositoryImpl implements IProductRepo {
  DioClient client = DioClient(Dio());
  @override
  getAllCategories() async {
    var responce = await client.request(endPoint: EndPoint.getAllCategories);
    List<String> categories = jsonDecode(responce.data).cast<String>();
    print(categories);
        HomeController.categories.value = categories;

    return categories;
  }

  @override
  getAllProducts() async {
    var responce = await client.request(endPoint: EndPoint.getAllProducts);
    final datas = ((jsonDecode(responce.data)) as List).map((e) {
      return Product.fromJson(e);
    }).toList();

    print(datas[0].category.toString());
    return datas;
  }

  @override
  getCategoryProducts({required String category_ID}) async {
    var responce = await client.customrequest(
        URL: "${EndPoint.getProductsInCategoryByID.url}/$category_ID",
        endPoint: EndPoint.getProductsInCategoryByID);

    final datas = ((jsonDecode(responce.data)) as List).map((e) {
      return Product.fromJson(e);
    }).toList();

    return datas;
  }

  @override
  getSingleProduct({required String product_ID}) async {
    var responce = await client.customrequest(
        URL: "${EndPoint.getSingleProductByID.url}/$product_ID",
        endPoint: EndPoint.getSingleProductByID);

    var product = Product.fromJson(jsonDecode(responce.data));
    print(product.title);
    return product;
  }
}
