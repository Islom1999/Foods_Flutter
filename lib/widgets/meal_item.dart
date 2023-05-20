import 'package:flutter/material.dart';
import 'package:foods/models/meals.dart';
import '../screens/category-meals_screen.dart';
import '../screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function toogleLike;
  final Function isFavorite;
  const MealItem({
    Key? key,
    required this.meal,
    required this.toogleLike,
    required this.isFavorite,
  }) : super(key: key);

  void _gotoDetails(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routName, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _gotoDetails(context),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  child: meal.imageUrl[0].startsWith("assets/") ? Image.asset(
                    meal.imageUrl[0],
                    fit: BoxFit.cover,
                  ) :  Image.network(
                    meal.imageUrl[0],
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(12.0),
                    width: 150,
                    color: Colors.black.withOpacity(0.5),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () => toogleLike(meal.id),
                      icon: Icon(
                        isFavorite(meal.id) ? Icons.favorite : Icons.favorite_outline,
                        color: Colors.black,
                      )),
                  Text("${meal.preparingTime} minutes"),
                  Text("\$${meal.price}"),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
