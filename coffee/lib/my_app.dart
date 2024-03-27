import 'package:flutter/material.dart';

import 'my_home_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:const  AppBarTheme(
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}