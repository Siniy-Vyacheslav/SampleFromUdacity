import 'package:flutter/material.dart';

import 'category.dart';
import 'unit.dart';

final _backgroundColor = Colors.amber[200];

class CategoryRoute extends StatefulWidget {
  const CategoryRoute();

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  final _categories = <Category>[];

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency'
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  static const _icons = <IconData>[
    Icons.straighten,
    Icons.aspect_ratio,
    Icons.web,
    Icons.bluetooth_disabled,
    Icons.query_builder,
    Icons.sd_storage,
    Icons.warning,
    Icons.monetization_on,
  ];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _categoryNames.length; i++) {
      _categories.add(
        Category(
          name: _categoryNames[i],
          color: _baseColors[i],
          iconLocation: _icons[i],
          units: _retrieveUnitList(_categoryNames[i]),
        ),
      );
    }
  }

  Widget _buildCategoryWidgets(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => _categories[index],
        itemCount: _categories.length,
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        children: _categories,
      );
    }
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i++;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(context),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Unit Converter',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
