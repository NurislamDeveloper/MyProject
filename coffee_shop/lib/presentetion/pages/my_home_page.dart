import 'package:coffee_shop/data/constans/const_dart.dart';
import 'package:coffee_shop/presentetion/components/bottom_nav_bar.dart';
import 'package:coffee_shop/presentetion/pages/cart_page.dart';
import 'package:coffee_shop/presentetion/pages/shop_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //navigator bottom bar
  int _selectedIndex = 0;
  void navigatorBottomBar (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  //pages 
  final List<Widget> _pages = [
    //shop page
    ShopPages(),
 
    
    //cart page
    CartPage(),
  ] ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: backgroundColor,
    bottomNavigationBar: MybottomNavBar(
      onTabChange: (index) => navigatorBottomBar (index),
    ),
    body: _pages[_selectedIndex],
    );
  }
}