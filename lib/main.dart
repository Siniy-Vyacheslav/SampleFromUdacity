import 'package:flutter/material.dart';

import 'category_route.dart';

void main() => runApp(UnitConverterApp());

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        primaryColor: Colors.red,
        textSelectionHandleColor: Colors.green,
      ),
      home: CategoryRoute(
      ),
    );
  }
}
