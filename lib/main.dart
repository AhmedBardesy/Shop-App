import 'package:app9_shop/pages/home_page.dart';
import 'package:app9_shop/pages/update_product_page.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProPage.id: (context) => UpdateProPage()
      },
      initialRoute: HomePage.id,
    );
  }
}

