import 'package:flutter/material.dart';
import 'package:mealsApp/screens/filtersScreen.dart';
import './screens/tabScreen.dart';
import './screens/mealDetail_screen.dart';
import './screens/categoryMeals_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/': (ctx) => TabsScreen(),
        CategoryMeals.routeNames: (ctx) => CategoryMeals(),
        MealDetails.routeNames: (ctx) => MealDetails(),
        FiltersScreen.routeNames: (cts)=>FiltersScreen(),
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
