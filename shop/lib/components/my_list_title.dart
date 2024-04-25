import 'package:flutter/material.dart';

class MyListTitle extends StatelessWidget {
  const MyListTitle(
      {super.key, required this.text, required this.icon, this.ontap});
  final String text;
  final IconData icon;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(text),
        onTap: ontap,
      ),
    );
  }
}
