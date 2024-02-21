import 'package:app9_shop/models/product_model.dart';
import 'package:app9_shop/helper/api_services.dart';
import 'package:flutter/material.dart';

class GetAllProductsService {
  static List<ProductModel> productList = [];
  static Future<List<ProductModel>> getallproducts(
      {@required String? token}) async {
    productList = [];
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    for (var i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromjson(data[i]));
    }
    return productList;
  }
}
