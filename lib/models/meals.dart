class Meal {
  final String id;
  final String title;
  final List<String> imageUrl;
  final String description;
  final List<String> ingridients;
  final int preparingTime;
  final double price;
  final String categoryId;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.ingridients,
    required this.preparingTime,
    required this.price,
    required this.categoryId,
  });
}

class Meals {
  List<Meal> _list = [
    Meal(
        id: "m1",
        title: "Cola",
        imageUrl: [
          "assets/images/cola.jpg",
          "assets/images/cola.jpg",
          "assets/images/cola.jpg"
        ],
        description: "Ajoyib Cola",
        ingridients: ["Suv", " qora rang"],
        preparingTime: 12,
        price: 20,
        categoryId: "c1"),
    Meal(
        id: "m2",
        title: "Osh",
        imageUrl: [
          "assets/images/osh.jpg",
          "assets/images/osh.jpg",
          "assets/images/osh.jpg"
        ],
        description: "Ajoyib Osh",
        ingridients: [
          "Guruch",
          "sabzi",
          "go'sh",
        ],
        preparingTime: 12,
        price: 20,
        categoryId: "c2"),
    Meal(
        id: "m3",
        title: "Pizza",
        imageUrl: [
          "assets/images/pizza.jpg",
          "assets/images/pizza2.jpg",
        ],
        description: "Ajoyib Pizza",
        ingridients: [
          "go'sht",
          "non",
        ],
        preparingTime: 12,
        price: 20,
        categoryId: "c3"),
    Meal(
        id: "m5",
        title: "Sezar",
        imageUrl: [
          "assets/images/salad.jpg",
          "assets/images/salad.jpg",
          "assets/images/salad.jpg"
        ],
        description: "Ajoyib Burger",
        ingridients: [
          "go'sht",
          "non",
        ],
        preparingTime: 12,
        price: 20,
        categoryId: "c5"),
    Meal(
        id: "m6",
        title: "Fast Food",
        imageUrl: [
          "assets/images/burger.jpg",
          "assets/images/burger.jpg",
          "assets/images/burger.jpg"
        ],
        description: "Ajoyib Salad",
        ingridients: [
          "pomidor",
          " go'sht",
        ],
        preparingTime: 12,
        price: 20,
        categoryId: "c6"),
  ];

  List<Meal> _favorites = [];

  List<Meal> get list {
    return _list;
  }

  List<Meal> get favorites {
    return _favorites;
  }

  void toogleLike(String mealId) {
    final mealIndex = _favorites.indexWhere((meal) => meal.id == mealId);
    if (mealIndex < 0) {
      _favorites.add(list.firstWhere((meal) => meal.id == mealId));
    } else {
      _favorites.removeWhere((meal) => meal.id == mealId);
    }
  }

  void addNewMeal(Meal meal) {
    _list.add(meal);
  }

  void deleteMeal(String id) {
    _list.removeWhere((meal) => meal.id == id);
  }
}
