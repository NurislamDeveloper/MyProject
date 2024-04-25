import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/my_drawer.dart';
import 'package:shop/components/my_product_title.dart';
import 'package:shop/models/shop.dart';

class ShopPages extends StatelessWidget {
  const ShopPages({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, //I need to check what's this ?
          elevation: 0,
          foregroundColor: Theme.of(context)
              .colorScheme
              .inversePrimary, //I need to check what's this ?
          title: const Text(
            "Shop Page",
          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(
                      context,
                      '/card_page',
                    ),
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                ))
          ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            //shor product
            Center(
              child: Text("Pick from a selected list of premium products ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  )),
            ),
            //product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    //get each individual product from shop
                    final product = products[index];

                    //return as a product title ui
                    return MyProductTitle(products: product);
                  }),
            ),
          ],
        ));
  }
}
