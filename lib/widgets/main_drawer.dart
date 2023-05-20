import 'package:flutter/material.dart';
import '../screens/tab_screen.dart';
import '../screens/products_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _buildMenuItem(IconData icon, String title, Function() handle) {
    return ListTile(
      onTap: handle,
      leading: Icon(icon),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: const Text("Menu"),
          ),
          _buildMenuItem(Icons.home, "Bosh Sahifa", () {
            Navigator.of(context).pushReplacementNamed(TabsScreen.routName);
          }),
         const Divider(
            height: 0,
          ),
          _buildMenuItem(Icons.category, "Maxsulotlar", () {
            Navigator.of(context).pushReplacementNamed(ProductsScreen.routName);
          }),
        ],
      ),
    );
  }
}
