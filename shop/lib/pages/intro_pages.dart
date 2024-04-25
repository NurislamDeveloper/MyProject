import 'package:flutter/material.dart';
import 'package:shop/components/my_buttom.dart';
import 'package:shop/constans/text_style.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 25,
            ),
            //title
            const Text(
              "Minimal Shop",
              style: BodyTextStyle.titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Premium Quality Products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
              const SizedBox(
              height: 25,
            ),
            //subtitle

            //buttom
            MyButtom(
              onTap: () => Navigator.pushNamed(context, '/shop_pages'),
              child:const  Icon(
                Icons.arrow_forward,
              ),
            )
          ],
        ),
      ),
    );
  }
}
