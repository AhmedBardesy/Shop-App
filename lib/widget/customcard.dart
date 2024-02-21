// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../pages/update_product_page.dart';

class customCard extends StatelessWidget {
  customCard(this.product);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Product Category ===== ${product.category}');
        Navigator.pushNamed(
          context,
          UpdateProPage.id,
          arguments: product,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 130,
            width: 220,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$' '${product.price} ',
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: -60,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                  height: 80, width: 80, child: Image.network(product.image)),
            ),
            height: 100,
          )
        ],
      ),
    );
  }
}
