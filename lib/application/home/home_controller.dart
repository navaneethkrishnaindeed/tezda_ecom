import 'package:flutter/material.dart';

import '../../domain/models/product/product.dart';

abstract class HomeController {
  static ValueNotifier<List<String>> categories = ValueNotifier([]);
  static ValueNotifier<List<Product>> products = ValueNotifier([]);
    static ValueNotifier<Product> product = ValueNotifier(Product());


}
