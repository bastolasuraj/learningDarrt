import "package:flutter/material.dart";
import '../widgets/categoryItem.dart';
import '../dummy_data.dart';

class CategoryMeals extends StatelessWidget {
  static const routeCategoryNames = '/categoriesMeals';
  // final String catId;
  // final String catName;
  // CategoryMeals(this.catId, this.catName);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
