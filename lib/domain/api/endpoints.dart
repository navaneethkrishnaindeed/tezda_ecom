import 'package:tezda_ecom/domain/api/base_url.dart';

enum RequestType { get, post, put, patch, delete }

enum EndPoint {
  signup,
  login,
  getAllCategories,
  getProductsInCategoryByID,
  getAllProducts,
  getSingleProductByID
}

// ignore: non_constant_identifier_names
final BASE_URL = API_BaseURL.getBaseURL();

extension URLExtension on EndPoint {
  String get url {
    switch (this) {
      case EndPoint.signup:
        return "$BASE_URL/users";
      case EndPoint.login:
        return "$BASE_URL/auth/login";
      case EndPoint.getAllCategories:
        return "$BASE_URL/products/categories";
      case EndPoint.getProductsInCategoryByID:
        return "$BASE_URL/products/category";
      case EndPoint.getAllProducts:
        return "$BASE_URL/products";
      case EndPoint.getSingleProductByID:
        return "$BASE_URL/products";

      default:
        throw Exception(["Endpoint not defined"]);
    }
  }
}

extension RequestMode on EndPoint {
  RequestType get requestType {
    RequestType requestType = RequestType.get;

    switch (this) {
      case EndPoint.signup:
        requestType = RequestType.post;
        break;
      case EndPoint.login:
        requestType = RequestType.get;
        break;
      case EndPoint.getAllCategories:
        requestType = RequestType.get;
        break;
      case EndPoint.getProductsInCategoryByID:
        requestType = RequestType.get;
        break;
      case EndPoint.getAllProducts:
        requestType = RequestType.get;
        break;
      case EndPoint.getSingleProductByID:
        requestType = RequestType.get;
        break;
    }
    return requestType;
  }
}

extension Token on EndPoint {
  bool get shouldAddToken {
    var shouldAdd = false;
    switch (this) {
      case EndPoint.signup:
        shouldAdd = false;
        break;

      default:
        break;
    }

    return shouldAdd;
  }
}
