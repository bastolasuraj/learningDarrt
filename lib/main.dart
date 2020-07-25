import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/filtersScreen.dart';
import './screens/tabScreen.dart';
import './screens/mealDetail_screen.dart';
import './screens/categoryMeals_screen.dart';
import './screens/categories_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];
  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavouriteMeal(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals App",
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.green,
        accentColor: Colors.teal,
        canvasColor: Color.fromRGBO(111, 111, 111, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                // fontSize: 34,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        CategoryMeals.routeNames: (ctx) => CategoryMeals(_availableMeals),
        MealDetails.routeNames: (ctx) => MealDetails(_toggleFavouriteMeal),
        FiltersScreen.routeNames: (cts) => FiltersScreen(_setFilters, _filters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Meals App FrontPage Ready to Deploy',
            ),
          ],
        ),
      ),
    );
  }
}
