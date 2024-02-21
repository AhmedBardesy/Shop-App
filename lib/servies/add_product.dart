import 'package:app9_shop/helper/api_services.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class PostService {
  static Future<ProductModel> addProduct({
    @required String? token,
    required String title,
    required num price,
    required String dec,
    required String image,
    required String category,
  }) async {
    var data =
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': dec,
      'image': image,
      'category': category
    });
    return ProductModel.fromjson(data);
  }
}
