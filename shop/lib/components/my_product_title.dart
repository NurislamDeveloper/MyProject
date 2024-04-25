import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/shop.dart';

class MyProductTitle extends StatelessWidget {
  const MyProductTitle({super.key, required this.products});
  final Products products;

  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Add the item to your cart ?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cansel",
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              context.read<Shop>().addToCart(products);
            },
            child:const  Text(
              "Yes",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(
        10, //here I used  like a SizedBox
      ),
      padding: const EdgeInsets.all(
        25,
      ),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // product image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(
                    25,
                  ),
                  child: Image.asset(products.imagePath)
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          //product name
          Text(
            products.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          //product decraption
          Text(
            products.decoration,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          //product price +add to cart buttom
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$' + products.price.toStringAsFixed(2)),
              //add  to cart buttom

              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
