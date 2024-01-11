import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tezda_ecom/domain/models/product/product.dart';

import 'application/home/categories/cubit/category_cubit.dart';
import 'application/home/products/cubit/products_cubit.dart';
import 'domain/api/dio_client.dart';
import 'domain/api/endpoints.dart';
import 'firebase_options.dart';
import 'presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // DioClient client = DioClient(Dio());
  // var responce = await client.customrequest(
  //     URL: "${EndPoint.getSingleProductByID.url}/5",
  //     endPoint: EndPoint.getSingleProductByID);

  // var p = Product.fromJson(jsonDecode(responce.data));
  // print(p.title);

  //  productCubitInstance.getAllProducts();
    // categoryCubitInstance.getCategoryList();
  runApp(const MyApp());
}
