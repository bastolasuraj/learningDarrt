import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavoriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text("No Vavourite yet."),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItems(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
            duration: favouriteMeals[index].duration,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
