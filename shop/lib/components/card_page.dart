import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/my_buttom.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/shop.dart';

class CardPages extends StatelessWidget {
  const CardPages({super.key});
  void removeItemFromCart(BuildContext context, Products product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from  your cart ?"),
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

              context.read<Shop>().removeFromCart(product);
            },
            child: const Text(
              "Yes",
            ),
          ),
        ],
      ),
    );
  }

  void payButtomPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text(
            "User wants to pay ! Connect this app to your payment backend"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Card Page",
        ),
      ),
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty? const Center(child: Text("Your card is empty...")):ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                //get individual item in cart
                final item = cart[index];

                //return as a cart title ui
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    onPressed: () => removeItemFromCart(context, item),
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButtom(
              onTap: () => payButtomPressed (context),
              child: const Text(
                "Pay Now",
              ),
            ),
          )
        ],
      ),
    );
  }
}
