

import 'package:coffee_shop/data/constans/models/coffee.dart';
import 'package:coffee_shop/data/constans/models/coffee_shop.dart';
import 'package:coffee_shop/presentetion/components/coffee_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPages extends StatefulWidget {
  const ShopPages({super.key});

  @override
  State<ShopPages> createState() => _ShopPagesState();
}

class _ShopPagesState extends State<ShopPages> {
  void addToCart(Coffee coffee) {
    // ignore: unnecessary_cast
    Provider.of<CoffeeShop>(context,listen: false).addItemCart(coffee);
    //let user know it add been successfully added
    showDialog(
    
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          "successfully added to cart",
        ),
        
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    //heading message
                    const Text(
                      "How would you like your coffee ?",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //list of coffee to buy
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.coffeeShop.length,
                        itemBuilder: (context, index) {
                          //get individual coffee
                          Coffee eachCoffee = value.coffeeShop[index];
                          //return the title for this coffee
                          return CoffeeTitle(
                            coffee: eachCoffee,
                            onPressed: () => addToCart(eachCoffee), icon:const  Icon(Icons.add,),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
