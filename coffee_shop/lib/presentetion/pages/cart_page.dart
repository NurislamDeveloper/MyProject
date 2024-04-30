import 'package:coffee_shop/data/constans/models/coffee.dart';
import 'package:coffee_shop/data/constans/models/coffee_shop.dart';
import 'package:coffee_shop/presentetion/components/coffee_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  void payNow() {
    /*
  fill out your payment service here 
    */
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading
              const Text(
                "Your Cart",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              //list of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    //get individual coffee
                    Coffee eachCoffee = value.userCart[index];

                    //return coffee title
                    return CoffeeTitle(
                      coffee: eachCoffee,
                      onPressed: () => removeFromCart(eachCoffee),
                      icon: const Icon(
                        Icons.delete,
                      ),
                    );
                  },
                ),
              ),
              //pay now
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: const EdgeInsets.all(
                    25,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child:const  Center(
                    child: Text(
                      "Pay now",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
