import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class Shop extends ChangeNotifier  {
  // products for sale
  final List<Products> _shop = [
      Products(
      name: "Product 1",
      price: 99.99,
      decoration: "item decraption ",
       imagePath: 'assets/nike.png',
    ),
      Products(
      name: "Product 1",
      price: 99.99,
      decoration: "item decraption ",
             imagePath: 'assets/shirt.png',
    ),
      Products(
      name: "Product 1",
      price: 99.99,
      decoration: "item decraption ",
             imagePath: 'assets/watch.png',
    ),
      Products(
      name: "Product 1",
      price: 99.99,
      decoration: "item decraption ",
             imagePath: 'assets/pn.png',
    ),

  ];

  //user cart
  List <Products> _cart = [];

  //get product list
  List <Products> get shop =>_shop;

  //get product cart
  List <Products> get cart =>_cart;

  //add item to cart
  void addToCart(Products item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart (Products item) {
    _cart.remove(item);
  }
}
