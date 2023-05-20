class Category {
  final String id;
  final String title;
  final String ImageUrl;

  const Category(
      {required this.id, required this.title, required this.ImageUrl});
}

class Categories {
  List<Category> _list = [
    Category(
        id: "c1", title: "Ichimliklar", ImageUrl: "assets/images/cola.jpg"),
    Category(
        id: "c2", title: "Milliy Taomlar", ImageUrl: "assets/images/osh.jpg"),
    Category(
        id: "c3",
        title: "Italya Taomlari",
        ImageUrl: "assets/images/pizza.jpg"),
    Category(
        id: "c4",
        title: "Fransiya Taomlari",
        ImageUrl: "assets/images/burger.jpg"),
    Category(id: "c5", title: "Saladlar", ImageUrl: "assets/images/salad.jpg"),
    Category(
        id: "c6", title: "Fast Food", ImageUrl: "assets/images/burger.jpg"),
  ];

  List<Category> get list {
    return _list;
  }
}
