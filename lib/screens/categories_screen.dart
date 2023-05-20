import 'package:flutter/material.dart';
import 'package:foods/models/meals.dart';
import '../models/category.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories;
  final List<Meal> meals;
  const CategoriesScreen({
    Key? key,
    required this.categories,
    required this.meals,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: categories.length > 0
          ? GridView(
              padding: const EdgeInsets.all(15.0),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              children: categories.map((category) {
                final categoryMeals = meals
                    .where((meal) => meal.categoryId == category.id)
                    .toList();
                return CategoryItem(
                  category: category,
                  meals: categoryMeals,
                );
              }).toList(),
            )
          : Center(
              child: Text("Ovqat Kategoriyasi Yo'q"),
            ),
    );
  }
}
