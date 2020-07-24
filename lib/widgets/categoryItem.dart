import "package:flutter/material.dart";
import '../screens/categoryMeals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id, this.title, this.color);
  void selectCategory(BuildContext ctxt) {
    Navigator.of(ctxt).pushNamed(
      CategoryMeals.routeCategoryNames,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(20),
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
