import 'package:flutter/material.dart';
import '../screens/mealDetail_screen.dart';
import '../models/meal.dart';

class MealItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItems({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext ctxt) {
    Navigator.of(ctxt).pushNamed(
      MealDetails.routeNames,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 300,
                    color: Colors.white70,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("$complexityText"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("$affordabilityText"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
