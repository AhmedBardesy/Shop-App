import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../servies/get_all_products.dart';
import '../widget/customcard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [Icon(Icons.shopping_cart)],
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'New Trending',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 16),
            child: FutureBuilder(
              future: GetAllProductsService.getallproducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return GridView.builder(
                    padding: const EdgeInsets.only(top: 70),
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: customCard(products[index]),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )));
  }
}
