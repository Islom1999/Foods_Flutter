import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../models/meals.dart';
import 'add_new_product_screen.dart';

class ProductsScreen extends StatefulWidget {
  final List<Meal> meals;
  final Function deleteMeal;

  const ProductsScreen({required this.meals, required this.deleteMeal});

  static const routName = '/products';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void _gotoAddNewProductScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AddNewProductScreen.routName).then((value) {
      if (value == true) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Maxsulotlar"),
        actions: [
          IconButton(
              onPressed: () => _gotoAddNewProductScreen(context),
              icon: Icon(Icons.add))
        ],
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
          itemCount: widget.meals.length,
          itemBuilder: (ctx, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        widget.meals[index].imageUrl[0].startsWith("assets/")
                            ? AssetImage(widget.meals[index].imageUrl[0])
                            : NetworkImage(widget.meals[index].imageUrl[0])
                                as ImageProvider,
                  ),
                  title: Text(widget.meals[index].title),
                  subtitle: Text("\$${widget.meals[index].price}"),
                  trailing: IconButton(
                      onPressed: () => widget.deleteMeal(widget.meals[index].id), icon: Icon(Icons.delete_forever)),
                ),
              )),
    );
  }
}
