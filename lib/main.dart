import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './models/Locations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: "Firt App",
    );
  }
}


