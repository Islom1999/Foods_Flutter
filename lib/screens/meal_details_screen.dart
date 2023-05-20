import 'package:flutter/material.dart';
import '../models/meals.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen({super.key});

  static const routName = "/meal-details";

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  int activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                viewportFraction: 1,
                initialPage: activeImageIndex,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeImageIndex = index;
                  });
                },
              ),
              items: meal.imageUrl.map((image) {
                
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: image.startsWith("assets/") ? Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ) :  Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: meal.imageUrl.map((image) {
                final ImageIndex = meal.imageUrl.indexOf(image);
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                  color: activeImageIndex == ImageIndex ?  Colors.black : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }).toList(),
            ),
            Text("\$${meal.price}", style: TextStyle(fontSize: 18.0)),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Ta'rifi",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(meal.description),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250.0,
              child: Card(
                margin: EdgeInsets.all(15.0),
                child: ListView.separated(
                    padding: EdgeInsets.all(10.0),
                    itemBuilder: (ctx, index) {
                      return Text(meal.ingridients[index]);
                    },
                    separatorBuilder: (ctx, index) {
                      return Divider();
                    },
                    itemCount: meal.ingridients.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
