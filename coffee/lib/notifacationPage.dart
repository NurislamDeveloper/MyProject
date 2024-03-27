import 'package:flutter/material.dart';

class NotifacationPage extends StatefulWidget {
  const NotifacationPage({super.key});

  @override
  State<NotifacationPage> createState() => _NotifacationPageState();
}

class _NotifacationPageState extends State<NotifacationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            size: 26,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
