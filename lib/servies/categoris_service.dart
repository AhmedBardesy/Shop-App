import 'package:app9_shop/models/product_model.dart';
import 'package:app9_shop/helper/api_services.dart';
import 'package:flutter/material.dart';

class CategorisService {
  static Future<List<ProductModel>> getCategorisProducts(
      {required String categoryName, @required String? token}) async {
    List<ProductModel> productList = [];
    Map<String, String> headers = {};
     productList = [];
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    for (var i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromjson(data[i]));
    }
    return productList;
  }
}
