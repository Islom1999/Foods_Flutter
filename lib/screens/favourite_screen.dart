import 'package:flutter/material.dart';
import 'package:foods/models/meals.dart';
import 'package:foods/widgets/meal_item.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Meal> favorites;
  final Function toogleLike;
  final Function isFavorite;
  const FavouriteScreen(
      {required this.favorites,
      required this.toogleLike,
      required this.isFavorite});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  void _toogleLike(String mealId) {
    setState(() {
      widget.toogleLike(mealId);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sevimli O'chirildi",), 
    action: SnackBarAction(label: "BEKOR QILISH", onPressed: () {
         setState(() {
      widget.toogleLike(mealId);
    });

    }),),);
  }

  @override
  Widget build(BuildContext context) {
    return widget.favorites.length > 0
        ? ListView.builder(
            itemCount: widget.favorites.length,
            itemBuilder: (ctx, index) => MealItem(
                meal: widget.favorites[index],
                toogleLike: _toogleLike,
                isFavorite: widget.isFavorite))
        : Center(
            child: Text("Hozircha bo'sh"),
          );
  }
}
