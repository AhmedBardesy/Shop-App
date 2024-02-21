import 'package:app9_shop/helper/api_services.dart';
import 'package:flutter/material.dart';

class GetAllCategoris {
  static Future<List<dynamic>> getallcatgoris({@required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    print(data);
    return data;
  }
}
