import 'package:flutter/material.dart';

void main() {
  runApp(const MyMarket());
}

class MyMarket extends StatelessWidget {
  const MyMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Scaffold(),
    );
  }
}
