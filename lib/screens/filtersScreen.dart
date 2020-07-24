import 'package:flutter/material.dart';
import 'package:mealsApp/widgets/appDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeNames = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Filters"),
      ),
      body: Center(child: Text("Filtered")),
    );
  }
}
