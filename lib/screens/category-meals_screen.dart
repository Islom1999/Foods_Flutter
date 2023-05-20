import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meals.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String CategoryName;

  final Function toogleLike;
  final Function isFavorite;

  const CategoryMealsScreen({
    required this.toogleLike,
    required this.isFavorite,
    Key? key,
  }) : super(key: key);

  static const RouteName = "/category-Meals";

  @override
  Widget build(BuildContext context) {
    final categorydate =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final title = categorydate["CategoryTitle"];
    final meals = categorydate["CategoryMeals"] as List<Meal>;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: meals.length > 0
          ? ListView.builder(
              padding: EdgeInsets.all(12.0),
              itemBuilder: (context, index) => MealItem(
                meal: meals[index],
                toogleLike: toogleLike,
                isFavorite: isFavorite,
              ),
              itemCount: meals.length,
            )
          : Center(
              child: Text("Afsuski ovqatlar yo'q!",
                  style: TextStyle(fontSize: 18.0)),
            ),
    );
  }
}
