import 'package:coffee_shop/data/constans/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier{
  //coffee for sale list
  final List<Coffee> _shop = [
    //black coffee
    Coffee(
      name: "Long Black",
      price: "4.10",
      imagePath: "assets/long.png",
    ),
    //latte
      Coffee(
      name: "Latte",
      price: "4.20",
      imagePath: "assets/latte.png",
    ),

    //expresso
      Coffee(
      name: "Espresso",
      price: "3.50",
      imagePath: "assets/espresso.png",
    ),

    //iced coffee
      Coffee(
      name: "Iced Coffee",
      price: "4.40",
      imagePath: "assets/iced.png",  ///here I need to download the image put in here 
    ),
  ];

  //user cart
  List <Coffee> _userCart = [];

  //get coffee list
  List <Coffee> get coffeeShop => _shop;

  //get user cart
  List <Coffee> get userCart =>_userCart;

  //add item to cart
  void addItemCart (Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
