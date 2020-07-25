import 'package:flutter/material.dart';
import 'package:mealsApp/widgets/appDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeNames = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenfree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactosefree = false;
  @override
  initState() {
    _glutenfree = widget.currentFilters['gluten'];
    _lactosefree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _switchlistTile(
      String title, String subtitle, bool item, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: item,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenfree,
                'lactose': _lactosefree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Meal Selection Adjustments",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _switchlistTile(
                  "Gluten Free",
                  "Gluten Free Filter",
                  _glutenfree,
                  (newValue) {
                    setState(
                      () {
                        _glutenfree = newValue;
                      },
                    );
                  },
                ),
                _switchlistTile(
                  "Lactose Free",
                  "Lactose Free Filter",
                  _lactosefree,
                  (newValue) {
                    setState(
                      () {
                        _lactosefree = newValue;
                      },
                    );
                  },
                ),
                _switchlistTile(
                  "vegan",
                  "vegan Filter",
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
                _switchlistTile(
                  "Vegetarian",
                  "Vegetarian Filter",
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
