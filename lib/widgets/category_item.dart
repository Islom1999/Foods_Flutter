import 'package:flutter/material.dart';
import 'package:foods/models/category.dart';
import 'package:foods/models/meals.dart';
import 'package:foods/screens/category-meals_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/categories_screen.dart';
import '../models/meals.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final List<Meal> meals;
  const CategoryItem({Key? key, required this.category, required this.meals}) : super(key: key);

  void _gotoCategoryMeals(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CategoryMealsScreen(CategoryName: category.title,)));

    Navigator.of(context)
        .pushNamed(CategoryMealsScreen.RouteName, arguments: {
          'CategoryTitle' : category.title,
          'CategoryMeals' : meals,
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _gotoCategoryMeals(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                category.ImageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  category.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
