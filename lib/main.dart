import 'package:flutter/material.dart';
import 'package:untitled11/login/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.deepOrange,
    ),
    home: EcommerceApp(),
  ));
}

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login(),
    );
  }
}
