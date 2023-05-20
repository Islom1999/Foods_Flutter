import 'package:flutter/material.dart';
import 'package:foods/models/category.dart';
import 'categories_screen.dart';
import 'favourite_screen.dart';
import '../models/category.dart';
import '../models/meals.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Category> categories;
  final Meals mealModels;
  final Function toogleLike;
  final Function isFavorite;
  const TabsScreen({
    required this.categories,
    required this.mealModels,
    required this.toogleLike,
    required this.isFavorite,
  });

  static const routName = '/';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var tabIndex = 0;
  List<Map<String, dynamic>> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      {
        'page': CategoriesScreen(
          categories: widget.categories,
          meals: widget.mealModels.list,
        ),
        'title': "Ovqatlar Menyusi",
      },
      {
        'page': FavouriteScreen(
          favorites: widget.mealModels.favorites,
          toogleLike: widget.toogleLike,
          isFavorite: widget.isFavorite,
        ),
        'title': 'Sevimli'
      }
    ];
  }

  void _changeTab(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(pages[tabIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[tabIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: _changeTab,
          currentIndex: tabIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: "Barchasi"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: "Sevimli"),
          ]),
    );
  }
}

//     DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Ovqatlar Menyusi"),
//           bottom: TabBar(tabs: [
//             Tab(
//               icon: Icon(Icons.more_horiz),
//               text: "Barchasi",
//             ),
//             Tab(
//               icon: Icon(
//                 Icons.favorite_outline,
//                 color: Colors.white,
//               ),
//               text: "Sevimlilar",
//             ),
//           ]),
//         ),
//         body: TabBarView(children: [
//           CategoriesScreen(
//             categories: categories,
//             meals: meals,
//           ),
//           FavouriteScreen(),
//         ]),
//       ),
//     );
