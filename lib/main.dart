import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/categories_screen.dart';
import './models/category.dart';
import './screens/category-meals_screen.dart';
import './models/meals.dart';
import './screens/meal_details_screen.dart';
import './screens/tab_screen.dart';
import './screens/products_screen.dart';
import './screens/add_new_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _categoryModel = Categories();

  final _mealModels = Meals();

  void _toogleLike(String mealId) {
    setState(() {
      _mealModels.toogleLike(mealId);
    });
  }
  bool _isFavorite(String mealId) {
    return _mealModels.favorites.any((meal) => meal.id == mealId);
  }

  void _addNewMeal(Meal meal) {
    setState(() {
      _mealModels.addNewMeal(meal);
    });
  }

  void _deleteMeal(String id) {
   setState(() {
      _mealModels.deleteMeal(id);
   });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: GoogleFonts.adventPro().fontFamily),
      debugShowCheckedModeBanner: false,
      // home: CategoriesScreen(categories: _categoryModel.list,meals: _mealModels.list),
      initialRoute: TabsScreen.routName,
      routes: {
        TabsScreen.routName: (ctx) => TabsScreen(
              categories: _categoryModel.list,
              mealModels: _mealModels,
              toogleLike: _toogleLike,
              isFavorite: _isFavorite,
            ),
        CategoryMealsScreen.RouteName: (context) => CategoryMealsScreen(
            toogleLike: _toogleLike, isFavorite: _isFavorite),
        MealDetailScreen.routName: (context) => MealDetailScreen(),
        ProductsScreen.routName: (context) =>
            ProductsScreen(meals: _mealModels.list, deleteMeal: _deleteMeal),
        AddNewProductScreen.routName: (context) => AddNewProductScreen(
            categories: _categoryModel.list, addNewFunction: _addNewMeal),
      },
    );
  }
}
