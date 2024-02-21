// ignore_for_file: missing_required_param

import 'package:app9_shop/models/product_model.dart';
import 'package:app9_shop/servies/update_product.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widget/customTextfromfield.dart';

class UpdateProPage extends StatefulWidget {
  const UpdateProPage({super.key});
  static String id = 'updateProductPage';

  @override
  State<UpdateProPage> createState() => _UpdateProPageState();
}

class _UpdateProPageState extends State<UpdateProPage> {
  String? productname, dec, image;
  double? price;
  bool isloading = false;
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  print('TiTleeeeeeee ${product.category}');
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                ))
          ],
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Form(
          //   key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  customTextFromField(
                    labelText: 'Product Name',
                    formKey: formkey,
                    onchange: (data) {
                      productname = data;
                    },
                  ),
                  const SizedBox(height: 10),
                  customTextFromField(
                      labelText: 'Desription',
                      formKey: formkey,
                      onchange: (data) {
                        dec = data;
                      }),
                  const SizedBox(height: 10),
                  customTextFromField(
                      keyboartype: TextInputType.number,
                      labelText: 'Price',
                      formKey: formkey,
                      onchange: (data) {
                        price = data as double;
                      }),
                  const SizedBox(height: 10),
                  customTextFromField(
                      labelText: 'Image',
                      formKey: formkey,
                      onchange: (data) {
                        image = data;
                      }),
                  const SizedBox(height: 10),
                  const SizedBox(height: 40),
                  Container(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isloading = true;
                            });

                            try {
                              await updatePorduct(product);
                              print('##########@@@@@@@@@@@@@@@@@@@@@SuCCess');
                              Navigator.pop(context);
                            } catch (e) {
                              print("EEEE ${e.toString()}");
                            }

                            setState(() {
                              isloading = false;
                            });
                          },
                          child: const Text('Update')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updatePorduct(ProductModel product) async {
    await UpdateProduct().updateProductService(
        id: product.id,
        title: productname == null ? product.title : productname!,
        price: price == null ? product.price : price!,
        dec: dec == null ? product.description : dec!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
