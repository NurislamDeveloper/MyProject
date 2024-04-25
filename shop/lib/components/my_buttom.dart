import 'package:flutter/material.dart';

class MyButtom extends StatelessWidget {
  const MyButtom({super.key, required this.onTap, required this.child});
  final Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        padding: const EdgeInsets.all(  //in padding I gave a size of Conteiner
          25,    
        ),
        child: child,
      ),
    );
  }
}
