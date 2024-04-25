import 'package:flutter/material.dart';
import 'package:shop/components/my_list_title.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //drawer header: logo
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ],
          ),

          //shot title
          MyListTitle(text: "Shop",
           icon: Icons.home,
           ontap: () => Navigator.pop(context),
          ),
          //card title
           MyListTitle(text: "Card",
           icon: Icons.shopping_cart,
           ontap: () {
            //pop drawer first 
            Navigator.pop(context);
            //go to cart page
          Navigator.pushNamed(context, '/card_page');
          },
          ),
          //exit shot title
           Padding(
             padding: const EdgeInsets.only(top: 430),
             child: MyListTitle(text: "Exit",
             icon: Icons.logout,
             ontap: () => Navigator.pushNamedAndRemoveUntil(context, '/intro_pages', (route) => false)
              
                       
                       ),
           ),
        ],
      ),
    );
  }
}
