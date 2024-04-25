
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/card_page.dart';
import 'package:shop/models/shop.dart';
import 'package:shop/pages/intro_pages.dart';
import 'package:shop/pages/shop_pages.dart';
import 'package:shop/themes/light_mode.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const IntroPage(),
      routes: {
        '/intro_pages': (context) =>const  IntroPage(),
        '/shop_pages': (context) => const ShopPages(),
        '/card_page': (context) => const CardPages(),
      },
    );
  }
}
