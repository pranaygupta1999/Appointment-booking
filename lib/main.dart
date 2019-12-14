import 'package:flutter/material.dart';
import 'package:testapp/screens/login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      title: "Firt App",
    );
  }
}


