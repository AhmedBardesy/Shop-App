import 'package:app9_shop/helper/api_services.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProductService({
    @required String? token,
    required int id,
    required String title,
    required dynamic price,
    required String dec,
    required String image,
    required String? category,
  }) async {
    print('===================product id = $id');
    Map<String, dynamic> data = await Api().Put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price.toString(),
        'description': dec,
        'image': image,
        'category': category
      },
    );
    print('=================DDAATTAA $data');
    return ProductModel.fromjson(data);
  }
}
