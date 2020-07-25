import 'package:flutter/material.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavoriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("No Vavourite yet."),
      ),
    );
  }
}
